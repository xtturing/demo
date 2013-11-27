//
//  TBdetailViewController.h
//  taobaodemo
//
//  Created by admin on 13-11-19.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IntroControll.h"
@interface TBdetailViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate,UIPopoverControllerDelegate,UITextFieldDelegate>{
    IBOutlet UIScrollView *scrollview;
    IBOutlet UIView *toolBarView;
    IBOutlet UILabel *titleLab;
    IBOutlet UIView *picView;
    IBOutlet UIView *rightView;
    IBOutlet UIView *recomendView;
    IBOutlet UIView *detailView;
    IBOutlet UIView *wangView;
    IBOutlet UIView *sizView;
    IBOutlet UIView *lineView;
    
    IBOutlet UILabel *monLab;
    IBOutlet UILabel *priceLab;
    IBOutlet UILabel *addresslab;
    IBOutlet UIButton *addressBtn;
    IBOutlet UILabel *mailLab;
    IBOutlet UILabel *maoLabe;
    IBOutlet UILabel *monthLabe;
    IBOutlet UILabel *shoplab;
    IBOutlet UILabel *commentlab;
    IBOutlet UILabel *sizelab;
    IBOutlet UILabel *colorlab;
    IBOutlet UILabel *numlab;
    IBOutlet UILabel *havelab;
    
    IBOutlet UIView *imageView;
    
    
    IBOutlet UIButton *menu1;
    IBOutlet UIButton *menu2;
    IBOutlet UIButton *menu3;
    IBOutlet UIButton *menu4;
    IBOutlet UIButton *menu5;
    IBOutlet UIButton *menu6;
    IBOutlet UIButton *menu7;
    
    IBOutlet UIButton *rbtn;
    
    IBOutlet UICollectionView *recomendListView;
    
    IBOutlet UIView *dView;
    IBOutlet UIButton *dbtn1;
    IBOutlet UIButton *dbtn2;
    IBOutlet UIButton *dbtn3;
    IBOutlet UILabel *dlab1;
    IBOutlet UILabel *dlab2;
    IBOutlet UIImageView *view1;
    IBOutlet UIImageView *view2;
    IBOutlet UIImageView *view3;
    
    IBOutlet UIView *blackView;
    UIView *buyView;
    UIView *bottom;
    UITextField *field;
}
-(void)dismissView;
-(IBAction)menuButtonAction:(id)sender;
-(IBAction)otherAction:(id)sender;
@end
