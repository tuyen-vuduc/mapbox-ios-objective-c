//
//  ExampleTableViewController.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "ExampleTableViewController.h"
#import "Examples.h"
#import "ExampleModel.h"

@interface ExampleTableViewController () <UISearchResultsUpdating>

@property NSArray* allExamples;
@property NSArray<ExampleModel *>* filteredExamples;

@end

@interface NSArray(HoF)
- (NSArray *)map:(id (^)(id obj))block;
- (NSArray *)filter:(BOOL (^)(id obj))block;
- (id)reduce:(id)initial
       block:(id (^)(id obj1, id obj2))block;
- (NSArray *)flatMap:(id (^)(id obj))block;
- (BOOL)contains:(BOOL (^)(id obj))block;
- (void)forEach:(void (^)(id obj))block;
@end

@implementation ExampleTableViewController

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString* searchText = searchController.searchBar.text;
    
    if (searchText != nil) {
        [self filterContentForSearchText:searchText];
    }
}

- (BOOL) isFiltering {
    return self.navigationItem.searchController != nil &&
            self.navigationItem.searchController.isActive;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Examples";
    
    self.allExamples = [Examples all];
    
    UISearchController *searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchController.searchResultsUpdater = self;
    searchController.searchBar.placeholder = @"Search examples";
    searchController.obscuresBackgroundDuringPresentation = false;
    
    self.navigationItem.searchController = searchController;
    self.navigationItem.hidesSearchBarWhenScrolling = false;
    [self.tableView registerClass:UITableViewCell.class
           forCellReuseIdentifier:@"exampleCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self isFiltering]) return 1;
    
    return self.allExamples.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([self isFiltering]) return nil;
    
    return self.allExamples[section][@"title"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self isFiltering]) return self.filteredExamples != nil ? self.filteredExamples.count : 0;
    
    NSArray* examples = (NSArray *) self.allExamples[section][@"examples"];
    return examples.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExampleModel* example;
    
    if ([self isFiltering]) {
        example = self.filteredExamples[indexPath.row];
    } else {
        NSArray* examples = (NSArray *) self.allExamples[indexPath.section][@"examples"];
        
        example = (ExampleModel *) examples[indexPath.row];
    }
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                   reuseIdentifier:@"exampleCell"];
    
    cell.textLabel.text = example.title;
    cell.textLabel.numberOfLines = 2;
    cell.detailTextLabel.text = [example.subtitle stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceCharacterSet];
    cell.detailTextLabel.numberOfLines = 2;
    
    if (@available(iOS 13.0, *)){
        cell.detailTextLabel.textColor = [UIColor secondaryLabelColor];
    } else {
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ExampleModel* example;
    
    if ([self isFiltering]) {
        example = self.filteredExamples[indexPath.row];
    } else {
        NSArray* examples = (NSArray *) self.allExamples[indexPath.section][@"examples"];
        
        example = (ExampleModel *) examples[indexPath.row];
    }
    
    UIViewController* exampleVc = [example makeViewController];
    [self.navigationController pushViewController:exampleVc animated:true];
}

- (void) filterContentForSearchText: (NSString*) searchText {
    NSArray *flatExamples = [self.allExamples flatMap:^id(id obj) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary* dict = (NSDictionary*) obj;
            
            return dict[@"examples"];
        }
        
        return obj;
    }];
    
    if (!searchText || [searchText length] == 0) {
        self.filteredExamples = flatExamples;
    } else {
        NSString* keyword = [searchText lowercaseString];
        
        self.filteredExamples = [flatExamples filter:^BOOL(id obj) {
            ExampleModel* example = (ExampleModel *) obj;
            
            return [[example.title lowercaseString] containsString:keyword];
        }];
    }
    
    [self.tableView reloadData];e
}

@end

@implementation NSArray(HoF)

#pragma mark - Map, filter, reduce, flatMap function without class restrictor
- (NSArray *)map:(id (^)(id obj))block {
    NSMutableArray *mutableArray = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [mutableArray addObject:block(obj)];
    }];
    return [mutableArray copy];
}

- (NSArray *)filter:(BOOL (^)(id obj))block {
    NSMutableArray *mutableArray = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (block(obj) == YES) {
            [mutableArray addObject:obj];
        }
    }];
    return [mutableArray copy];
}

- (id)reduce:(id)initial
       block:(id (^)(id obj1, id obj2))block {
    __block id obj = initial;
    [self enumerateObjectsUsingBlock:^(id _obj, NSUInteger idx, BOOL *stop) {
        obj = block(obj, _obj);
    }];
    return obj;
}

- (NSArray *)flatMap:(id (^)(id obj))block {
    NSMutableArray *mutableArray = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id _obj = block(obj);
        if ([_obj isKindOfClass:[NSArray class]]) {
            NSArray *_array = [_obj flatMap:block];
            [mutableArray addObjectsFromArray:_array];
            return;
        }
        [mutableArray addObject:_obj];
    }];
    return [mutableArray copy];
}

- (BOOL)contains:(BOOL (^)(id obj))block {
    __block BOOL contains = NO;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (block(obj) == YES) {
            contains = YES;
            *stop = YES;
        }
    }];
    return contains;
}

- (void)forEach:(void (^)(id obj))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

@end
