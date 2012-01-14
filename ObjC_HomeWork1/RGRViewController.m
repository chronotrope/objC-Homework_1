//
//  RGRViewController.m
//  ObjC_HomeWork1
//
//  Created by Ruben Robles (public) on 1/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RGRViewController.h"

@implementation RGRViewController
@synthesize jobData, jobDetail;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //RGR My job titles
    NSArray *jobArray = [[NSArray alloc] initWithObjects:@"ICU RN", @"Cardiothoracic ICU RN/Charge Nurse", @"Informatics, Clinical Analyst", @"Informatics, Consultant Specialist", @"Part-time web developer",@"Aspiring IOS Developer", nil];
    self.jobData = jobArray;
    
    NSArray *jobDetailArray = [[NSArray alloc] initWithObjects:@"CPR, Starting IVs, Giving shots, defibrillation...", @"Herding cats, Treating Heart Tx pts, Titrating IV drips...", @"Cerner Millenium Suite, Tomcat server, JDBC, IBM DB2 RDBMS...", @"Intersystems Caché, Epic Systems product suite, HL7, SOAP, Python...", @"Linux, Apache,PHP, Djanjo, Subversion...",@"Xcode, Git, Objective-C, OOP...", nil];
    self.jobDetail = jobDetailArray;

    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.jobData = nil;
    //self.jobDetail = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    
}



#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.jobData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *RubenTableIdentifier = @"RubenTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             RubenTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1 
                reuseIdentifier:RubenTableIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
    cell.textLabel.text = [jobData objectAtIndex:row];
    return cell;
    
    }


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    NSString *rowValue = [jobDetail objectAtIndex:row];
    NSString *message = [[NSString alloc] initWithFormat:
                         @"Details:  %@", rowValue];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Detailed Job View:"
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"OK, that's enough."
                          otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
