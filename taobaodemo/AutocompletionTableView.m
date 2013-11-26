//
//  AutocompletionTableView.m
//
//  Created by Gushin Arseniy on 11.03.12.
//  Copyright (c) 2012 Arseniy Gushin. All rights reserved.
//

#import "AutocompletionTableView.h"
#import "UIColor+Taobao.h"
#import "TBFont.h"
#import "TBViewController.h"
@interface AutocompletionTableView (){
    Boolean isHistory;
}

@property (nonatomic, strong) NSArray *suggestionOptions; // of selected NSStrings 
@property (nonatomic, strong) UITextField *textField; // will set automatically as user enters text
@property (nonatomic, strong) UIFont *cellLabelFont; // will copy style from assigned textfield
@property (nonatomic,strong) NSArray *historyOptions;
@property (nonatomic,strong) UIViewController *parentView;
@end

@implementation AutocompletionTableView

@synthesize suggestionsDictionary = _suggestionsDictionary;
@synthesize suggestionOptions = _suggestionOptions;
@synthesize textField = _textField;
@synthesize cellLabelFont = _cellLabelFont;
@synthesize options = _options;
@synthesize historyOptions=_historyOptions;
#pragma mark - Initialization
- (UITableView *)initWithTextField:(UITextField *)textField inViewController:(UIViewController *) parentViewController withOptions:(NSDictionary *)options
{
    //set the options first
    self.options = options;
    
    // frame must align to the textfield 
    CGRect frame = CGRectMake(textField.frame.origin.x-7, textField.frame.origin.y+textField.frame.size.height+42, textField.frame.size.width+78, 350);
    
    // save the font info to reuse in cells
    self.cellLabelFont = textField.font;
    
    self = [super initWithFrame:frame
             style:UITableViewStylePlain];
    
    self.delegate = self;
    self.dataSource = self;
    self.scrollEnabled = YES;
    CALayer *layer=[self layer];
    [layer setBorderWidth:1.0];
    [layer setCornerRadius:4.0];
    [layer setBorderColor:[[UIColor colorFromRGB:0xe2e5e7] CGColor]];
    // turn off standard correction
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.delegate=self;
    self.userInteractionEnabled=YES;
    // to get rid of "extra empty cell" on the bottom
    // when there's only one cell in the table
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, textField.frame.size.width, 1)]; 
    v.backgroundColor = [UIColor clearColor];
    [self setTableFooterView:v];
    self.hidden = YES;
    self.parentView=parentViewController;
    [self.parentView.view addSubview:self];
    isHistory=YES;
    _historyOptions=[NSArray arrayWithObjects:@"nop",@"kitty外套",@"秋装",@"衬衫",@"vinii",@"xiias",@"asdaas", @"qweqew", @"qewqee",  nil];
    return self;
}


-(void)tapOnce:(UITapGestureRecognizer*)recognizer//手势方法
{
    TBViewController *tab=(TBViewController *)self.parentView;
    [tab.blackView removeGestureRecognizer:recognizer];
    [self hideOptionsView];
}

#pragma mark - Logic staff
- (BOOL) substringIsInDictionary:(NSString *)subString
{
    NSMutableArray *tmpArray = [NSMutableArray array];
//    NSRange range;
    
    for (NSString *tmpString in self.suggestionsDictionary)
    {
//        range = ([[self.options valueForKey:ACOCaseSensitive] isEqualToNumber:[NSNumber numberWithInt:1]]) ? [tmpString rangeOfString:subString] : [tmpString rangeOfString:subString options:NSCaseInsensitiveSearch];
//        if (range.location != NSNotFound) [tmpArray addObject:tmpString];
        [tmpArray addObject:[NSString stringWithFormat:@"%@%@",subString,tmpString]];
    }
    if ([tmpArray count]>0)
    {
        self.suggestionOptions = tmpArray;
        return YES;
    }
    return NO;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(isHistory){
        return self.historyOptions.count+1;
    }else{
        return self.suggestionOptions.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(isHistory){
        static NSString *historyCompleteRowIdentifier = @"historyCompleteRowIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:historyCompleteRowIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault reuseIdentifier:historyCompleteRowIdentifier];
        }
        
        if ([self.options valueForKey:ACOUseSourceFont])
        {
            cell.textLabel.font = [self.options valueForKey:ACOUseSourceFont];
        } else
        {
            cell.textLabel.font = self.cellLabelFont;
        }
        cell.textLabel.textColor=[UIColor colorFromRGB:0x444444];
        
        cell.textLabel.adjustsFontSizeToFitWidth = NO;
        if(indexPath.row==0){
            cell.textLabel.text = @"搜索历史";
            cell.imageView.image=nil;
            UIImageView *view=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"清除搜索历史"]];
            cell.accessoryView=view;
        }else {
            if((indexPath.row-1)<3){
                cell.imageView.image=[UIImage imageNamed:@"商品icon"];
            }else{
                cell.imageView.image=[UIImage imageNamed:@"店铺icon"];
            }
            cell.textLabel.text = [self.historyOptions objectAtIndex:(indexPath.row-1)];
            cell.accessoryView=nil;
        }
        
        return cell;
    }else{
        static NSString *AutoCompleteRowIdentifier = @"AutoCompleteRowIdentifier";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:AutoCompleteRowIdentifier];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:AutoCompleteRowIdentifier];
        }
        
        if ([self.options valueForKey:ACOUseSourceFont])
        {
            cell.textLabel.font = [self.options valueForKey:ACOUseSourceFont];
        } else
        {
            cell.textLabel.font = self.cellLabelFont;
        }
        cell.textLabel.textColor=[UIColor colorFromRGB:0x444444];
        cell.detailTextLabel.text=[NSString stringWithFormat: @"共%ld件", (-(indexPath.row-10)*1000)];
        cell.detailTextLabel.font=[TBFont fzltFontOfSize:14];
        cell.detailTextLabel.textColor=[UIColor colorFromRGB:0xb1b1b1];
        cell.textLabel.adjustsFontSizeToFitWidth = NO;
        cell.textLabel.text = [self.suggestionOptions objectAtIndex:indexPath.row];
        
        return cell;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(isHistory){
        if(indexPath.row==0){
            return 40.0;
        }else{
            return 50.0;
        }
    }else{
       return 50.0;
    }
    
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(isHistory){
        if(indexPath.row>0){
           [self.textField setText:[self.historyOptions objectAtIndex:indexPath.row-1]];
        }        
        [self hideOptionsView];
    }else{
        [self.textField setText:[self.suggestionOptions objectAtIndex:indexPath.row]];
        [self hideOptionsView];
    }
}

#pragma mark - UITextField delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    isHistory=YES;
    self.textField = textField;
    [self showOptionsView];
    [self resignFirstResponder];
    [self reloadData];
}
- (void)textFieldValueChanged:(UITextField *)textField
{
    isHistory=NO;
    self.textField = textField;
    NSString *curString = textField.text;
    
    if (![curString length])
    {
        isHistory=YES;
        [self showOptionsView];
        [self reloadData];
    } else if ([self substringIsInDictionary:curString])
        {
            [self showOptionsView];
            [self reloadData];
        } else [self hideOptionsView];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self hideOptionsView];
    return YES;
}

#pragma mark - Options view control
- (void)showOptionsView
{
    self.hidden = NO;
    TBViewController *tab=(TBViewController *)self.parentView;
    [tab.blackView setFrame:CGRectMake(0, 81, 1024, 687)];
    tab.blackView.hidden=NO;
    UITapGestureRecognizer * blacktap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce:)];//定义一个手势
    [blacktap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [tab.blackView addGestureRecognizer:blacktap];//添加手势到View中
}

- (void) hideOptionsView
{
    self.hidden = YES;
    TBViewController *tab=(TBViewController *)self.parentView;
    [tab.blackView setFrame:CGRectMake(0, 151, 1024, 617)];
    tab.blackView.hidden=YES;
    [self.textField resignFirstResponder];
}

@end
