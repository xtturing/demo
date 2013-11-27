//
//  TBViewController.m
//  taobaodemo
//
//  Created by admin on 13-11-15.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "TBViewController.h"
#import "TBsearchCell.h"
#import "TBsearchSmallCell.h"
#import "UIColor+Taobao.h"
#import "TBFont.h"
#import "TSPopoverController.h"
#import <QuartzCore/QuartzCore.h>
#import "AutocompletionTableView.h"
#import "TBdetailViewController.h"
#import "TBShopViewController.h"
@interface TBViewController (){
    Boolean isPrice;
    Boolean isSearchType;
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIPopoverController *popover;
    UIView *allTypeView;
    UIView *menuView;
    
}
@property (nonatomic, strong) AutocompletionTableView *autoCompleter;
@end

@implementation TBViewController
@synthesize blackView;
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    isPrice=YES;
    isSearchType=YES;
    self.view.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    listView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    smallListView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    typeView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    toolBarView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"toolbar_bg.png"]];
    searchView.backgroundColor=[UIColor whiteColor];
    CALayer *layer=[searchView layer];
    [layer setBorderWidth:1.0];
    [layer setCornerRadius:4.0];
    [layer setBorderColor:[[UIColor colorFromRGB:0xe2e5e7] CGColor]];
    
    [menu1 setImage:[UIImage imageNamed:@"关闭点击"] forState:UIControlStateHighlighted];
    [menu3 setImage:[UIImage imageNamed:@"我的淘宝点击"] forState:UIControlStateHighlighted];
    [menu4 setImage:[UIImage imageNamed:@"信息点击"] forState:UIControlStateHighlighted];
    [menu5 setImage:[UIImage imageNamed:@"购物车点击"] forState:UIControlStateHighlighted];
    [menu6 setImage:[UIImage imageNamed:@"浏览历史点击"] forState:UIControlStateHighlighted];
    
    lab1.titleLabel.font=[TBFont fzltFontOfSize:16];
    [lab1 setTintColor:[UIColor colorFromRGB:0x888888]];
    lab1.tag=1;
    
    [lab10 addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
    [lab1 addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
    lab11.titleLabel.font=[TBFont fzltFontOfSize:16];
    [lab11 setTintColor:[UIColor colorFromRGB:0xFF5500]];
    lab11.tag=11;
    [lab11 addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
    lab12.titleLabel.font=[TBFont fzltFontOfSize:16];
    [lab12 setTintColor:[UIColor colorFromRGB:0x888888]];
    lab12.tag=12;
    [lab12 addTarget:self action:@selector(typeAction:) forControlEvents:UIControlEventTouchUpInside];
    lab13.titleLabel.font=[TBFont fzltFontOfSize:16];
    [lab13 setTintColor:[UIColor colorFromRGB:0x888888]];
    lab13.tag=13;
    [lab13 addTarget:self action:@selector(maoAction:) forControlEvents:UIControlEventTouchUpInside];
    lab14.titleLabel.font=[TBFont fzltFontOfSize:16];
    [lab14 setTintColor:[UIColor colorFromRGB:0x888888]];
    lab14.tag=14;
    [lab14 addTarget:self action:@selector(maoAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    lab2.titleLabel.font=[TBFont fzltFontOfSize:16];
    [lab2 setTintColor:[UIColor colorFromRGB:0xFF5500]];
    lab2.tag=2;
    [lab2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    lab3.titleLabel.font=[TBFont fzltFontOfSize:16];
    [lab3 setTintColor:[UIColor colorFromRGB:0x888888]];
    lab3.tag=3;
    [lab3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    lab4.titleLabel.font=[TBFont fzltFontOfSize:16];
    [lab4 setTintColor:[UIColor colorFromRGB:0x888888]];
    lab4.tag=4;
    [lab4 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    lab5.titleLabel.font=[TBFont fzltFontOfSize:16];
    [lab5 setTintColor:[UIColor colorFromRGB:0x888888]];
    lab5.tag=5;
    [lab5 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    lab6.titleLabel.font=[TBFont fzltFontOfSize:16];
    [lab6 setTintColor:[UIColor colorFromRGB:0xFF5500]];
    lab6.tag=6;
    [lab6 addTarget:self action:@selector(picAction:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    listView.delegate=self;
    listView.dataSource=self;
    listView.showsVerticalScrollIndicator=NO;
    listView.showsHorizontalScrollIndicator=NO;
    
    smallListView.delegate=self;
    smallListView.dataSource=self;
    smallListView.showsVerticalScrollIndicator=NO;
    smallListView.showsHorizontalScrollIndicator=NO;
    
    searchField.font=[TBFont fzltFontOfSize:16];
    searchField.textColor=[UIColor colorFromRGB:0x444444];
    
    
    allTypeView=[[UIView alloc ] initWithFrame:CGRectMake(0, 151, 1024, 317)];
    allTypeView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"所有分类"]];
    [self tapBackground];
    allTypeView.hidden=YES;
    [self.view addSubview:allTypeView];
    
    menuView=[[UIView alloc ] initWithFrame:CGRectMake(588, 0, 436, 768)];
    menuView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"更多-2"]];
    [self tapMenuBackground];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(0, 40,80, 60)];
    [btn setBackgroundColor:[UIColor clearColor]];
    [menuView addSubview:btn];
    menuView.hidden=YES;
    [self.view addSubview:menuView];
    
    [searchField addTarget:self.autoCompleter action:@selector(textFieldDidBeginEditing:) forControlEvents:UIControlEventTouchDown];
    [searchField addTarget:self.autoCompleter action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
   
    
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)tapBuyBackground //在ViewDidLoad中调用
{
    UISwipeGestureRecognizer *downRecognizer=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tapBuyRight:)];
    downRecognizer.direction=UISwipeGestureRecognizerDirectionRight;
    [buyView addGestureRecognizer:downRecognizer];
    
    
}
-(void)tapBuyOnce:(UITapGestureRecognizer*)recognizer//手势方法
{
    [buyView removeFromSuperview];
    blackView.hidden=YES;
    [blackView removeGestureRecognizer:recognizer];
}
-(void)tapBuyRight:(UISwipeGestureRecognizer*)recognizer//手势方法
{
    [buyView removeFromSuperview];
    blackView.hidden=YES;
}

-(void)typeAction:(id)sender{
    [self dismissView];
    UITapGestureRecognizer * blacktap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce:)];//定义一个手势
    [blacktap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [blackView addGestureRecognizer:blacktap];//添加手势到View中
    
    allTypeView.hidden=NO;
    blackView.hidden=NO;
    [listView setFrame:CGRectMake(16, 468, 992, 300)];
    [smallListView setFrame:CGRectMake(22, 468, 980, 300)];
}
-(void)maoAction:(id)sender{
    UIButton *btn = (UIButton *)sender;
    [lab13 setTintColor:[UIColor colorFromRGB:0x888888]];
    [lab14 setTintColor:[UIColor colorFromRGB:0x888888]];
    [btn setTintColor:[UIColor colorFromRGB:0xFF5500]];
}
-(void)tapBackground //在ViewDidLoad中调用
{
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce:)];//定义一个手势
    [tap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [allTypeView addGestureRecognizer:tap];//添加手势到View中
    
    UISwipeGestureRecognizer *downRecognizer=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tapDown:)];
    downRecognizer.direction=UISwipeGestureRecognizerDirectionDown;
    [typeView addGestureRecognizer:downRecognizer];
    
    UISwipeGestureRecognizer *upRecognizer=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tapUp:)];
    upRecognizer.direction=UISwipeGestureRecognizerDirectionUp;
    [allTypeView addGestureRecognizer:upRecognizer];
    
}
-(void)tapMenuBackground //在ViewDidLoad中调用
{
    UISwipeGestureRecognizer *downRecognizer=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tapRight:)];
    downRecognizer.direction=UISwipeGestureRecognizerDirectionRight;
    [menuView addGestureRecognizer:downRecognizer];
    
    
}
-(void)tapMenuOnce:(UITapGestureRecognizer*)recognizer//手势方法
{
    menuView.hidden=YES;
    blackView.hidden=YES;
    [blackView removeGestureRecognizer:recognizer];
}
-(void)tapOnce:(UITapGestureRecognizer*)recognizer//手势方法
{
    allTypeView.hidden=YES;
    blackView.frame=CGRectMake(0,0, 1024, 768);
    blackView.hidden=YES;
    [blackView removeGestureRecognizer:recognizer];
    [listView setFrame:CGRectMake(16, 151, 992, 617)];
    [smallListView setFrame:CGRectMake(22, 151, 980, 617)];
}
-(void)tapDown:(UISwipeGestureRecognizer*)recognizer//手势方法
{
    [self dismissView];
    UITapGestureRecognizer * blacktap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnce:)];//定义一个手势
    [blacktap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [blackView addGestureRecognizer:blacktap];//添加手势到View中
    allTypeView.hidden=NO;
    blackView.hidden=NO;
    [listView setFrame:CGRectMake(16, 468, 992, 300)];
    [smallListView setFrame:CGRectMake(22, 468, 980, 300)];
}
-(void)tapUp:(UISwipeGestureRecognizer*)recognizer//手势方法
{
    allTypeView.hidden=YES;
    blackView.hidden=YES;
    blackView.frame=CGRectMake(0,0, 1024, 768);
    [listView setFrame:CGRectMake(16, 151, 992, 617)];
    [smallListView setFrame:CGRectMake(22, 151, 980, 617)];
}
-(void)tapRight:(UISwipeGestureRecognizer*)recognizer//手势方法
{
    menuView.hidden=YES;
    blackView.hidden=YES;
}
-(void)menuAction:(id)sender{
    menuView.hidden=YES;
    blackView.hidden=YES;
}
-(void)btnAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    [lab2 setTintColor:[UIColor colorFromRGB:0x888888]];
    [lab3 setTintColor:[UIColor colorFromRGB:0x888888]];
    [lab4 setTintColor:[UIColor colorFromRGB:0x888888]];
    [lab5 setTintColor:[UIColor colorFromRGB:0x888888]];
    [btn setTintColor:[UIColor colorFromRGB:0xFF5500]];
    [img2 setImage:[UIImage imageNamed:@"其它排序"]];
    [img3 setImage:[UIImage imageNamed:@"其它排序"]];
    [img4 setImage:[UIImage imageNamed:@"价格排序1"]];
    [img5 setImage:[UIImage imageNamed:@"其它排序"]];
    switch (btn.tag) {
       
        
        case 2:{
            [img2 setImage:[UIImage imageNamed:@"其它排序2"]];
             break;
        }
        case 3:{
            [img3 setImage:[UIImage imageNamed:@"其它排序2"]];
             break;
        }
        case 4:{
            if(isPrice){
                [img4 setImage:[UIImage imageNamed:@"价格排序2"]];
                isPrice=NO;
            }else {
                [img4 setImage:[UIImage imageNamed:@"价格排序3"]];
                isPrice=YES;
            }
             break;
        }
        case 5:{
            [img5 setImage:[UIImage imageNamed:@"其它排序2"]];
             break;
        }

        default:
            break;
    }
    [listView reloadData];
    [smallListView reloadData];
}
-(void)picAction:(id)sender  forEvent:(UIEvent*)senderEvent{
    [self dismissView];
    UIViewController *viewController=[[UIViewController alloc] init];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 182)];
    
    [viewController setView:view];
    UIButton *btn = (UIButton *)sender;
    btn1=[UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(0, 0, 200, 60);
    [btn1 setTitle:@"小图" forState:UIControlStateNormal];
    [btn1.titleLabel setFont:[TBFont fzltFontOfSize:18]];
    if([btn.titleLabel.text isEqualToString:@"小图"]){
        [btn1 setTintColor:[UIColor colorFromRGB:0xff5500]];
    }else{
        [btn1 setTintColor:[UIColor colorFromRGB:0x444444]];
    }
    btn1.tag=2001;
    [btn1 addTarget:self action:@selector(picChoose:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn1];
    [view addSubview:[self draw:CGRectMake(0, 60, 200, 1)]];
    
    
    btn2=[UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame =CGRectMake(0, 61, 200, 60);
    [btn2 setTitle:@"大图" forState:UIControlStateNormal];
    [btn2.titleLabel setFont:[TBFont fzltFontOfSize:18]];
    if([btn.titleLabel.text isEqualToString:@"大图"]){
        [btn2 setTintColor:[UIColor colorFromRGB:0xff5500]];
    }else{
        [btn2 setTintColor:[UIColor colorFromRGB:0x444444]];
    }
    btn2.tag=2002;
    [btn2 addTarget:self action:@selector(picChoose:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn2];
    
    [view addSubview:[self draw:CGRectMake(0, 121, 200, 1)]];
    
    btn3=[UIButton buttonWithType:UIButtonTypeSystem];
    btn3.frame =CGRectMake(0, 122, 200, 60);
    [btn3 setTitle:@"列表" forState:UIControlStateNormal];
    [btn3.titleLabel setFont:[TBFont fzltFontOfSize:18]];
    if([btn.titleLabel.text isEqualToString:@"列表"]){
        [btn3 setTintColor:[UIColor colorFromRGB:0xff5500]];
    }else{
        [btn3 setTintColor:[UIColor colorFromRGB:0x444444]];
    }
    [btn3 addTarget:self action:@selector(picChoose:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn3];
//    TSPopoverController *popoverController = [[TSPopoverController alloc] initWithContentViewController:viewController];
//    popoverController.cornerRadius = 1;
//    popoverController.titleText = Nil;
//    popoverController.popoverBaseColor = [UIColor whiteColor];
//    popoverController.popoverGradient= NO;
//    //    popoverController.arrowPosition = TSPopoverArrowPositionHorizontal;
//    [popoverController showPopoverWithTouch:senderEvent];
    
    popover = [[UIPopoverController alloc] initWithContentViewController:viewController];
    [popover setPopoverContentSize:CGSizeMake(200,182)];
    [popover presentPopoverFromRect:((UIButton *)sender).frame
                                        inView:typeView
                       permittedArrowDirections:UIPopoverArrowDirectionUp
                    animated:NO];
//    popover.backgroundColor=[UIColor whiteColor];
}
- (void)popoverControllerDidDismissPopover:(UIPopoverController*)popoverController{
    if (popover) {
        [popover dismissPopoverAnimated:YES];
        popover=nil;
    }
}
-(UIImageView *)draw:(CGRect)rect{
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:rect];
    imageView.backgroundColor=[UIColor colorFromRGB:0xEEEEEE];
    return imageView;
}
-(void)picChoose:(id)sender{
    UIButton *btn = (UIButton *)sender;
    [btn1 setTintColor:[UIColor colorFromRGB:0x444444]];
    [btn2 setTintColor:[UIColor colorFromRGB:0x444444]];
    [btn3 setTintColor:[UIColor colorFromRGB:0x444444]];
    [lab6 setTitle:btn.titleLabel.text forState:UIControlStateNormal];
    [btn setTintColor:[UIColor colorFromRGB:0xff5500]];
    if(btn.tag==2001){
        listView.hidden=YES;
        smallListView.hidden=NO;
        [smallListView reloadData];
    }else if (btn.tag==2002){
        listView.hidden=NO;
        smallListView.hidden=YES;
        [listView reloadData];
    }else{
        
    }
    [self popoverControllerDidDismissPopover:popover];
}

-(IBAction)searchType:(id)sender{
    [self dismissView];
    UIViewController *viewController=[[UIViewController alloc] init];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 121)];
    
    [viewController setView:view];
    btn1=[UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame = CGRectMake(0, 0, 200, 60);
    [btn1 setTitle:@"店铺" forState:UIControlStateNormal];
    [btn1.titleLabel setFont:[TBFont fzltFontOfSize:18]];
    
    [btn1 addTarget:self action:@selector(searchtypeChange:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn1];
    
    [view addSubview:[self draw:CGRectMake(0, 60, 200, 1)]];
    
    
    btn2=[UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame =CGRectMake(0, 61, 200, 60);
    [btn2 setTitle:@"商品" forState:UIControlStateNormal];
    [btn2.titleLabel setFont:[TBFont fzltFontOfSize:18]];
   
    [btn2 addTarget:self action:@selector(searchtypeChange:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn2];
    if(isSearchType){
        [btn2 setTintColor:[UIColor colorFromRGB:0xff5500]];
        [btn1 setTintColor:[UIColor colorFromRGB:0x444444]];
    }else{
        [btn1 setTintColor:[UIColor colorFromRGB:0xff5500]];
        [btn2 setTintColor:[UIColor colorFromRGB:0x444444]];
    }
    popover = [[UIPopoverController alloc] initWithContentViewController:viewController];
    [popover setPopoverContentSize:CGSizeMake(200,121)];
    [popover presentPopoverFromRect:((UIButton *)sender).frame
                             inView:searchView
           permittedArrowDirections:UIPopoverArrowDirectionUp
                           animated:NO];
//    popover.backgroundColor=[UIColor whiteColor];
    
}
-(void)searchtypeChange:(id)sender{
    if(isSearchType){
        [menu7 setImage:[UIImage imageNamed:@"选择店铺"] forState:UIControlStateNormal];
        isSearchType=NO;
        [btn2 setTintColor:[UIColor colorFromRGB:0xff5500]];
        [btn1 setTintColor:[UIColor colorFromRGB:0x444444]];
    }else{
        [menu7 setImage:[UIImage imageNamed:@"选择商品"] forState:UIControlStateNormal];
        isSearchType=YES;
        [btn1 setTintColor:[UIColor colorFromRGB:0xff5500]];
        [btn2 setTintColor:[UIColor colorFromRGB:0x444444]];
    }
    [self popoverControllerDidDismissPopover:popover];
}
-(IBAction)menuButtonAction:(id)sender{
    UIButton *btn = (UIButton *)sender;
//    [menu1 setImage:[UIImage imageNamed:@"关闭"] forState:UIControlStateNormal];
//    [menu2 setImage:[UIImage imageNamed:@"首页"] forState:UIControlStateNormal];
//    [menu3 setImage:[UIImage imageNamed:@"我的淘宝"] forState:UIControlStateNormal];
//    [menu4 setImage:[UIImage imageNamed:@"信息"] forState:UIControlStateNormal];
//    [menu5 setImage:[UIImage imageNamed:@"购物车"] forState:UIControlStateNormal];
//    [menu6 setImage:[UIImage imageNamed:@"浏览历史"] forState:UIControlStateNormal];
//    [menu7 setImage:[UIImage imageNamed:@"更多-1"] forState:UIControlStateNormal];
    
    switch (btn.tag) {
            
            
        case 1001:{
            [self closeAction:sender];
            break;
        }
        case 1002:{
            [self homeAction:sender];
            break;
        }
        case 1003:{
            [self loginAction:sender];
            break;
        }
        case 1004:{
            [self messageAction:sender];
            break;
        }
        case 1005:{
            [self shopAction:sender];
            break;
        }
        case 1010:{
            [self shopAction:sender];
            break;
        }
        case 1006:{
            [self historyAction:sender];
            break;
        }
        case 1007:{
            [self moreAction:sender];
            break;
        }
        default:
            break;
    }
}
-(void)homeAction:(id)sender{
    [self dismissView];
    UITapGestureRecognizer * blacktap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMenuOnce:)];//定义一个手势
    [blacktap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [blackView addGestureRecognizer:blacktap];//添加手势到View中
    blackView.frame=CGRectMake(0, 0, 1024, 768);
    menuView.hidden=NO;
    blackView.hidden=NO;
}
-(void)loginAction:(id)sender{
    [self dismissView];
    UIViewController *viewController=[[UIViewController alloc] init];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 323, 601)];
    view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"我的淘宝-1"]];
    
//    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setImage:[UIImage imageNamed:@"立即购买"] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"立即购买点击"] forState:UIControlStateHighlighted];
//    [btn addTarget:self action:@selector(shopAction:) forControlEvents:UIControlEventTouchUpInside];
//    [btn setFrame:CGRectMake(87, 611, 130, 40)];
//    [view addSubview:btn];
    
    
    
    [viewController setView:view];
    popover = [[UIPopoverController alloc] initWithContentViewController:viewController];
    [popover setPopoverContentSize:CGSizeMake(323, 601)];
    [popover presentPopoverFromRect:((UIButton *)sender).frame
                             inView:toolBarView
           permittedArrowDirections:UIPopoverArrowDirectionUp
                           animated:NO];
}
-(void)messageAction:(id)sender{
    
}
-(void)shopAction:(id)sender{
    [self dismissView];
    UITapGestureRecognizer * blacktap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBuyOnce:)];//定义一个手势
    [blacktap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [blackView addGestureRecognizer:blacktap];//添加手势到View中
    TBShopViewController *shop= [self.storyboard instantiateViewControllerWithIdentifier:@"TBShopViewController"];
    buyView=shop.view;
    buyView.frame=CGRectMake(424, 0, buyView.frame.size.width, buyView.frame.size.height);
    [self tapBuyBackground];
    [self addChildViewController:shop];
    [self.view addSubview:buyView];
    blackView.hidden=NO;
}
-(void)historyAction:(id)sender{
    
}
-(void)moreAction:(id)sender{
    
}
-(void)closeAction:(id)sender{
    
}
- (AutocompletionTableView *)autoCompleter
{
    if (!_autoCompleter)
    {
        NSMutableDictionary *options = [NSMutableDictionary dictionaryWithCapacity:2];
        [options setValue:[NSNumber numberWithBool:YES] forKey:ACOCaseSensitive];
        [options setValue:nil forKey:ACOUseSourceFont];
        
        _autoCompleter = [[AutocompletionTableView alloc] initWithTextField:searchField inViewController:self withOptions:options];
        _autoCompleter.suggestionsDictionary = [NSArray arrayWithObjects:@"",@"外套",@"秋装",@"衬衫",@"裤子",@"鞋子",@"袜子", @"皮带", @"短裤",  nil];
    }
    return _autoCompleter;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 30;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(collectionView.tag==1001){
        TBsearchSmallCell *cell = (TBsearchSmallCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"TBsearchSmallCellIdentifier"
                                                                                       forIndexPath:indexPath];
        [cell setImageText:[NSString stringWithFormat:@"%d",(int)(indexPath.row%7+1)]];
        return cell;
    }else{
        TBsearchCell *cell = (TBsearchCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"TBsearchCellIdentifier"
                                                                                       forIndexPath:indexPath];
        [cell setImageText:[NSString stringWithFormat:@"%d",(int)(indexPath.row%7+1)]];
        return cell;
    }
    
}
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    TBdetailViewController *tbDetail=[[TBdetailViewController alloc] init];
//    [self.navigationController pushViewController:tbDetail animated:YES];
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"pushDetail"])
    {
//        TBdetailViewController *detail =
//        segue.destinationViewController;
    }
}
-(void)dismissView{
    [self popoverControllerDidDismissPopover:popover];
    blackView.hidden=YES;
    menuView.hidden=YES;
    buyView.hidden=YES;
    allTypeView.hidden=YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
