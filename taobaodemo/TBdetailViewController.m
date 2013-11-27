//
//  TBdetailViewController.m
//  taobaodemo
//
//  Created by admin on 13-11-19.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "TBdetailViewController.h"
#import "UIColor+Taobao.h"
#import "TBFont.h"
#import "TBrecomendCell.h"
#import <QuartzCore/QuartzCore.h>
#import "TBShopViewController.h"
@interface TBdetailViewController (){
    UIPopoverController *popover;
    UIView *menuView;
    UIView *wangwang;
}

@end

@implementation TBdetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor=[UIColor colorFromRGB:0xfcfcfc];
    picView.backgroundColor=[UIColor colorFromRGB:0xfcfcfc];
    rightView.backgroundColor=[UIColor colorFromRGB:0xfcfcfc];
    recomendListView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    recomendView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    detailView.backgroundColor=[UIColor colorFromRGB:0xfcfcfc];
    toolBarView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"toolbar_bg.png"]];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    
    scrollview.delegate=self;
    scrollview.alwaysBounceVertical=YES;
    scrollview.scrollEnabled=YES;
    scrollview.showsHorizontalScrollIndicator = NO;
    scrollview.showsVerticalScrollIndicator = NO;
    
    recomendListView.delegate=self;
    recomendListView.dataSource=self;
    recomendListView.showsVerticalScrollIndicator=NO;
    recomendListView.showsHorizontalScrollIndicator=NO;
    
    [menu1 setImage:[UIImage imageNamed:@"关闭点击"] forState:UIControlStateHighlighted];
    [menu3 setImage:[UIImage imageNamed:@"我的淘宝点击"] forState:UIControlStateHighlighted];
    [menu4 setImage:[UIImage imageNamed:@"信息点击"] forState:UIControlStateHighlighted];
    [menu5 setImage:[UIImage imageNamed:@"购物车点击"] forState:UIControlStateHighlighted];
    [menu6 setImage:[UIImage imageNamed:@"浏览历史点击"] forState:UIControlStateHighlighted];
    
    rbtn.titleLabel.font=[TBFont fzltFontOfSize:16];
    [rbtn setTintColor:[UIColor colorFromRGB:0x888888]];
    
    titleLab.font=[TBFont fzltFontOfSize:16];
    [titleLab setTextColor:[UIColor colorFromRGB:0x444444]];
    titleLab.tag=1;
    
    
    priceLab.font=[TBFont DINRegularFontOfSize:36];
    [priceLab setTextColor:[UIColor colorFromRGB:0xff5500]];
    priceLab.tag=2;
    
    monLab.font=[TBFont DINRegularFontOfSize:24];
    [monLab setTextColor:[UIColor colorFromRGB:0xff5500]];
    
    addresslab.font=[TBFont fzltFontOfSize:14];
    [addresslab setTextColor:[UIColor colorFromRGB:0x444444]];
    addresslab.tag=3;
    
    addressBtn.titleLabel.font=[TBFont fzltFontOfSize:14];
    [addressBtn setTintColor:[UIColor colorFromRGB:0x444444]];
    addressBtn.tag=13;
    
    mailLab.font=[TBFont fzltFontOfSize:13];
    [mailLab setTextColor:[UIColor colorFromRGB:0x444444]];
    mailLab.tag=4;
    
    maoLabe.font=[TBFont fzltFontOfSize:14];
    [maoLabe setTextColor:[UIColor colorFromRGB:0x444444]];
    maoLabe.tag=5;
    
    monthLabe.font=[TBFont fzltFontOfSize:14];
    [monthLabe setTextColor:[UIColor colorFromRGB:0x444444]];
    monthLabe.tag=6;
    
    
    shoplab.font=[TBFont fzltFontOfSize:14];
    [shoplab setTextColor:[UIColor colorFromRGB:0x444444]];
    shoplab.tag=7;
    
    commentlab.font=[TBFont fzltFontOfSize:14];
    [commentlab setTextColor:[UIColor colorFromRGB:0x888888]];
    commentlab.tag=8;
    
    sizelab.font=[TBFont fzltFontOfSize:14];
    [sizelab setTextColor:[UIColor colorFromRGB:0x444444]];
    sizelab.tag=9;
    
    colorlab.font=[TBFont fzltFontOfSize:14];
    [colorlab setTextColor:[UIColor colorFromRGB:0x444444]];
    colorlab.tag=10;
    
    numlab.font=[TBFont DINBoldFontOfSize:16];
    [numlab setTextColor:[UIColor colorFromRGB:0x444444]];
    numlab.tag=11;
    
    havelab.font=[TBFont fzltFontOfSize:14];
    [havelab setTextColor:[UIColor colorFromRGB:0x888888]];
    havelab.tag=12;
    
    
    dlab1.font=[TBFont DINBoldFontOfSize:16];
    [dlab1 setTextColor:[UIColor colorFromRGB:0xff5500]];
    
    dlab1.tag=13;
    
    dlab2.font=[TBFont DINBoldFontOfSize:16];
    [dlab2 setTextColor:[UIColor colorFromRGB:0xff5500]];
    dlab2.tag=14;
    
    dbtn1.titleLabel.font=[TBFont fzltFontOfSize:16];
    [dbtn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [dbtn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    dbtn2.titleLabel.font=[TBFont fzltFontOfSize:16];
    [dbtn2 setTintColor:[UIColor colorFromRGB:0x444444]];
    
    dbtn3.titleLabel.font=[TBFont fzltFontOfSize:16];
    [dbtn3 setTintColor:[UIColor colorFromRGB:0x444444]];
    dView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    
    view1.backgroundColor=[UIColor colorFromRGB:0xebebeb];
    view2.backgroundColor=[UIColor colorFromRGB:0xebebeb];
    view3.backgroundColor=[UIColor colorFromRGB:0xebebeb];
    
    CALayer *layer=[wangView layer];
    [layer setBorderWidth:2.0];
    [layer setBorderColor:[[UIColor colorFromRGB:0xededed] CGColor]];
    [layer setCornerRadius:4.0];
    wangView.backgroundColor=[UIColor whiteColor];
    
    
    lineView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"分割线平铺"]];
    
    sizView.backgroundColor=[UIColor colorFromRGB:0xf4f7fd];
    CALayer *slayer=[sizView layer];
    [slayer setBorderWidth:2.0];
    [slayer setCornerRadius:4.0];
    [slayer setBorderColor:[[UIColor colorFromRGB:0xe9edf3] CGColor]];
    
    IntroModel *model1 = [[IntroModel alloc] initWithTitle:@"" description:@"" image:@"img1.png"];
    
    IntroModel *model2 = [[IntroModel alloc] initWithTitle:@"" description:@"" image:@"img2.png"];
    
    IntroModel *model3 = [[IntroModel alloc] initWithTitle:@"" description:@"" image:@"img3.png"];
    
    IntroControll *view = [[IntroControll alloc] initWithFrame:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height) pages:@[model1, model2, model3]];
	// Do any additional setup after loading the view.
    [imageView addSubview:view];
    
    
    menuView=[[UIView alloc ] initWithFrame:CGRectMake(588, 0, 436, 768)];
    menuView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"更多-2"]];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(menuAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(0, 40,80, 60)];
    [btn setBackgroundColor:[UIColor clearColor]];
    [menuView addSubview:btn];
    [self tapMenuBackground];
    menuView.hidden=YES;
    [self.view addSubview:menuView];
    
}
-(void)tapBuyBackground //在ViewDidLoad中调用
{
    UISwipeGestureRecognizer *downRecognizer=[[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tapBuyRight:)];
    downRecognizer.direction=UISwipeGestureRecognizerDirectionRight;
    [buyView addGestureRecognizer:downRecognizer];
    
    
}
-(void)tapWangOnce:(UITapGestureRecognizer*)recognizer//手势方法
{
    wangwang.hidden=YES;
    blackView.hidden=YES;
    blackView.frame=CGRectMake(0,0, 1024, 768);
    [blackView removeGestureRecognizer:recognizer];
    [field resignFirstResponder];
}
-(void)wangCloseAction:(id)sender{
    wangwang.hidden=YES;
    blackView.hidden=YES;
    blackView.frame=CGRectMake(0,0, 1024, 768);
    [field resignFirstResponder];
}
-(void)wangShopAction:(id)sender{
    
}
-(void)tapBuyOnce:(UITapGestureRecognizer*)recognizer//手势方法
{
    [buyView removeFromSuperview];
    blackView.hidden=YES;
    blackView.frame=CGRectMake(0,0, 1024, 768);
    [blackView removeGestureRecognizer:recognizer];
}
-(void)tapBuyRight:(UISwipeGestureRecognizer*)recognizer//手势方法
{
    [buyView removeFromSuperview];
    blackView.hidden=YES;
    blackView.frame=CGRectMake(0,0, 1024, 768);
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
-(void)tapRight:(UISwipeGestureRecognizer*)recognizer//手势方法
{
    menuView.hidden=YES;
    blackView.hidden=YES;
}
-(void)menuAction:(id)sender{
    menuView.hidden=YES;
    blackView.hidden=YES;
}
-(IBAction)menuButtonAction:(id)sender{
    UIButton *btn = (UIButton *)sender;
    
    
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
        case 1011:{
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

-(IBAction)otherAction:(id)sender{
    UIButton *btn = (UIButton *)sender;
    
    
    switch (btn.tag) {
        case 2001:{
            [self moreOther:sender];
            break;
        }
        case 2002:{
            [self wangwang:sender];
            break;
        }
        default:
            break;
    }

}


-(void)wangwang:(id)sender{
    [self dismissView];
    blackView.hidden=NO;
    if(wangwang){
        wangwang.hidden=NO;
        wangwang.frame=CGRectMake(177, 10, 670, 748);
        bottom.frame=CGRectMake(0, wangwang.frame.size.height-61, 670, 61);
    }else{
        wangwang=[[UIView alloc] initWithFrame:CGRectMake(177, 10, 670, 748)];
        wangwang.backgroundColor=[UIColor whiteColor];
        CALayer *layer=[wangwang layer];
        [layer setBorderWidth:1.0];
        [layer setBorderColor:[[UIColor colorFromRGB:0xededed] CGColor]];
        [layer setCornerRadius:4.0];
        
        UIView *top=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 670, 281)];
        [top setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"旺旺top"]]];
        [wangwang addSubview:top];
        
        
        bottom=[[UIView alloc] initWithFrame:CGRectMake(0, wangwang.frame.size.height-61, 670, 61)];
        [bottom setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"旺旺bottom"]]];
        
        
        [wangwang addSubview:bottom];
        
        
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(wangCloseAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setFrame:CGRectMake(0, 0,60, 60)];
        [btn setBackgroundColor:[UIColor clearColor]];
        [top addSubview:btn];
        
        UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn1 addTarget:self action:@selector(wangShopAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn1 setFrame:CGRectMake(610,0,60, 60)];
        [btn1 setBackgroundColor:[UIColor clearColor]];
        [top addSubview:btn1];
        
        field=[[UITextField alloc] initWithFrame:CGRectMake(70,10,465, 43)];
        [field setBorderStyle:UITextBorderStyleNone];
        field.clearButtonMode=UITextFieldViewModeWhileEditing;
        field.delegate=self;
        field.keyboardType=UIKeyboardTypeDefault;
        field.userInteractionEnabled=YES;
        field.returnKeyType=UIReturnKeyDone;
        [bottom addSubview:field];
        
        
        [self.view addSubview:wangwang];
    }
    UITapGestureRecognizer * blacktap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapWangOnce:)];//定义一个手势
    [blacktap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [blackView addGestureRecognizer:blacktap];//添加手势到View中
}

-(void)homeAction:(id)sender{
    [self dismissView];
    UITapGestureRecognizer * blacktap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMenuOnce:)];//定义一个手势
    [blacktap setNumberOfTouchesRequired:1];//触击次数这里设为1
    [blackView addGestureRecognizer:blacktap];//添加手势到View中
    menuView.hidden=NO;
    blackView.hidden=NO;
}
-(void)loginAction:(id)sender{
    [self dismissView];
    UIViewController *viewController=[[UIViewController alloc] init];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 510, 674)];
    view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"SKU"]];
    
    //    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    //    [btn setImage:[UIImage imageNamed:@"立即购买"] forState:UIControlStateNormal];
    //    [btn setImage:[UIImage imageNamed:@"立即购买点击"] forState:UIControlStateHighlighted];
    //    [btn addTarget:self action:@selector(shopAction:) forControlEvents:UIControlEventTouchUpInside];
    //    [btn setFrame:CGRectMake(87, 611, 130, 40)];
    //    [view addSubview:btn];
    
    
    
    [viewController setView:view];
    popover = [[UIPopoverController alloc] initWithContentViewController:viewController];
    [popover setPopoverContentSize:CGSizeMake(510,674)];
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
    blackView.frame=CGRectMake(0, 0, 424, 768);
    blackView.hidden=NO;
}
-(void)historyAction:(id)sender{
    
}
-(void)moreAction:(id)sender{
    
}
-(void)moreOther:(id)sender{
    [self dismissView];
    UIViewController *viewController=[[UIViewController alloc] init];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 510, 674)];
    view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"SKU"]];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"立即购买"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"立即购买点击"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(shopAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(87, 611, 130, 40)];
    [view addSubview:btn];
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"加入购物车"] forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"加入购物车点击"] forState:UIControlStateHighlighted];
    [btn1 addTarget:self action:@selector(addShopAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setFrame:CGRectMake(293, 611, 130, 40)];
    [view addSubview:btn1];
    
    [viewController setView:view];
    popover = [[UIPopoverController alloc] initWithContentViewController:viewController];
    [popover setPopoverContentSize:CGSizeMake(510,674)];
    [popover presentPopoverFromRect:((UIButton *)sender).frame
                             inView:sizView
           permittedArrowDirections:UIPopoverArrowDirectionRight
                           animated:NO];
//    popover.backgroundColor=[UIColor whiteColor];
}
- (void)popoverControllerDidDismissPopover:(UIPopoverController*)popoverController{
    if (popover) {
        [popover dismissPopoverAnimated:YES];
        popover=nil;
    }
}


-(void)addShopAction:(id)sender{
}


-(void)closeAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UIScrollViewDelegate
//只要滚动了就会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
    //    NSLog(@" scrollViewDidScroll");
    
}
//开始拖拽视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    [scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+980)];
    
    NSLog(@"scrollViewWillBeginDragging");
}
//完成拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
{
    NSLog(@"scrollViewDidEndDragging");
}
//将开始降速时
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;
{

    NSLog(@"scrollViewWillBeginDecelerating");
}

//减速停止了时执行，手触摸时执行执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{

    NSLog(@"scrollViewDidEndDecelerating");
}
//滚动动画停止时执行,代码改变时出发,也就是setContentOffset改变时
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
{

    NSLog(@"scrollViewDidEndScrollingAnimation");
}
//完成放大缩小时调用
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale;
{

    NSLog(@"scale between minimum and maximum. called after any 'bounce' animations");
}// scale between minimum and maximum. called after any 'bounce' animations



- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;
{

    NSLog(@"scrollViewDidScrollToTop");
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 30;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
        TBrecomendCell *cell = (TBrecomendCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"TBrecomendCellIdentifier"
                                                                                       forIndexPath:indexPath];
        [cell setImageText:[NSString stringWithFormat:@"%d",(int)(indexPath.row%7+1)]];
        return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    TBdetailViewController *view=[self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
    [self.navigationController pushViewController:view animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self resignFirstResponder];
    wangwang.frame=CGRectMake(177, 10, 670, 406);
    bottom.frame=CGRectMake(0, wangwang.frame.size.height-61, 670, 61);
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    wangwang.frame=CGRectMake(177, 10, 670, 748);
    bottom.frame=CGRectMake(0, wangwang.frame.size.height-61, 670, 61);
    return YES;
}
-(void)dismissView{
    if(wangwang){
        wangwang.hidden=YES;
    }
    [self popoverControllerDidDismissPopover:popover];
    blackView.hidden=YES;
    menuView.hidden=YES;
    buyView.hidden=YES;
}
@end
