//
//  TBViewController.h
//  taobaodemo
//
//  Created by admin on 13-11-15.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TBViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UIPopoverControllerDelegate>{
    IBOutlet UIView *toolBarView;
    IBOutlet UIView *searchView;
    IBOutlet UIView *typeView;
    IBOutlet UIView *blackView;
    
    IBOutlet UICollectionView *listView;
    IBOutlet UICollectionView *smallListView;
    
    IBOutlet UIButton *menu1;
    IBOutlet UIButton *menu2;
    IBOutlet UIButton *menu3;
    IBOutlet UIButton *menu4;
    IBOutlet UIButton *menu5;
    IBOutlet UIButton *menu6;
    IBOutlet UIButton *menu7;
    
    IBOutlet UIButton *lab1;
    IBOutlet UIButton *lab2;
    IBOutlet UIButton *lab3;
    IBOutlet UIButton *lab4;
    IBOutlet UIButton *lab5;
    IBOutlet UIButton *lab6;
    
    IBOutlet UIButton *lab10;
    IBOutlet UIButton *lab11;
    IBOutlet UIButton *lab12;
    IBOutlet UIButton *lab13;
    IBOutlet UIButton *lab14;
    
    
    IBOutlet UIImageView *img2;
    IBOutlet UIImageView *img3;
    IBOutlet UIImageView *img4;
    IBOutlet UIImageView *img5;
    
    IBOutlet UITextField *searchField;
    
    IBOutlet UIView *buyView;
}
-(IBAction)searchType:(id)sender;
-(IBAction)menuButtonAction:(id)sender;

@property(nonatomic,retain) UIView *blackView;

@end
