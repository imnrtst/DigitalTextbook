//
//  AllNotesTableViewController.m
//  Digital Textbook
//
//  Created by Lab User on 3/14/17.
//  Copyright © 2017 Shang Wang. All rights reserved.
//

#import "AllNotesTableViewController.h"
#import "BookPageViewController.h"
@interface AllNotesTableViewController ()

@end

@implementation AllNotesTableViewController{
    NSMutableArray *NotetableData;
}
@synthesize noteTableView;
@synthesize parent_View_Controller;
@synthesize parentBookPageViewCtr;

- (void)viewDidLoad {
    [super viewDidLoad];
    //set the size
    CGRect rect=CGRectMake(0, 0, 513, 768);
    [self.view setFrame:rect];
    self.view.layer.borderColor = [UIColor grayColor].CGColor;
    self.view.layer.borderWidth = 2;
   // [noteTableView setFrame:rect];
    [noteTableView setDelegate:self];
    [noteTableView setDataSource:self];
    //populate with a sample
   // NotetableData = [NSMutableArray arrayWithObjects: @"Stuff", @"Thangs", @"Stuff and Thangs", @"Tired", nil];
    if (NotetableData == nil){ NotetableData = [[NSMutableArray alloc] init]; }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [NotetableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [NotetableData objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;
    //cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    [cell.textLabel setLineBreakMode:NSLineBreakByWordWrapping];
    return cell;
}

//gets the content of all notes
-(void) getAllNotes{

    
    [NotetableData removeAllObjects]; // empty the table data
    for(NodeCell* cell in parentBookPageViewCtr.cmapView.conceptNodeArray){
        NSString *testString = cell.appendedNoteString;
        if (testString.length != 0){ // appended note string is nonempty
           
            NSString *takeNoteTitleString;
            if (cell.hasHighlight){ //node  created from book
                takeNoteTitleString = [NSString stringWithFormat:@"Notes on \"%@\"     Page: %i", cell.text.text, cell.pageNum + 1];
            }
            else if (cell.linkingUrl.absoluteString.length > 0){ //node created from web browser
                NSString *siteTitle = cell.linkingUrlTitle;
                takeNoteTitleString = [NSString stringWithFormat:@"Notes on \"%@\"     Site: %@", cell.text.text, siteTitle];
            }
            else {
                takeNoteTitleString = [NSString stringWithFormat:@"Notes on \"%@\"", cell.text.text];
            }
            
            //Printing for debug purposes
            NSLog(takeNoteTitleString);
            NSLog(cell.appendedNoteString);
            //Add to cell table data array
            [NotetableData addObject: takeNoteTitleString];
            [NotetableData addObject: cell.appendedNoteString];
            [NotetableData addObject: @""];
            
            
            
           
        }
    }
    [self.noteTableView reloadData];
   // [self viewDidLoad];

}

@end
