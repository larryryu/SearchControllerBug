//
//  ViewController2.m
//  SearchControllerBug
//
//  Created by Lukman Sanusi on 9/8/16.
//  Copyright © 2016 ForeFlight. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()<UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate>
@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshSearchControllerIfNeeded];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshSearchControllerIfNeeded];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.searchController = nil; // uncomment to apply workaround
}

- (void)refreshSearchControllerIfNeeded{
    if (self.searchController) {
        return;
    }
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.definesPresentationContext = YES;
    
    self.searchController.delegate = self;
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchBar.delegate = self;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    
    self.searchController.searchBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44);
    
    self.tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableview.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tableview];
    
    [self.tableview.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    [self.tableview.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    [self.tableview.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
    [self.tableview.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
    
    self.tableview.tableHeaderView = self.searchController.searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
}

- (void)dealloc{
    NSLog(@"ViewController 2 Deallocated");
}

@end
