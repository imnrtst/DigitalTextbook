//
//  AllNotesTableViewController.h
//  Digital Textbook
//
//  Created by Lab User on 3/14/17.
//  Copyright © 2017 Shang Wang. All rights reserved.
//

#import "ContentViewController.h"
#import "CmapController.h"
#import <UIKit/UIKit.h>

@interface AllNotesTableViewController : UIViewController <UIWebViewDelegate,UIGestureRecognizerDelegate, UITableViewDataSource, UITableViewDelegate,UIGestureRecognizerDelegate,UIWebViewDelegate,UIScrollViewDelegate,UICollectionViewDataSource, UICollectionViewDelegate, UIActionSheetDelegate>


@property (nonatomic, strong) IBOutlet UITableView *noteTableView;
@property (strong, nonatomic)ContentViewController* parent_View_Controller;
@property (nonatomic, strong)  BookPageViewController *parentBookPageViewCtr;

-(void) getAllNotes;


@end
