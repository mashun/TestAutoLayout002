//
//  FirstTableViewCell.h
//  TestAutoLayout003
//
//  Created by dev on 15/5/22.
//  Copyright (c) 2015年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FirstTableViewCell;

@protocol FirstTableViewCellDelegate <NSObject>

- (void)clickDetailButton:(FirstTableViewCell *)cell;

@end

@interface FirstTableViewCell : UITableViewCell
{
    UILabel *_titleLabel;
    UILabel *_contentLabel;
    UIImageView *_photoImage;
    UIButton *_detaileButton;
}

@property (nonatomic, strong)NSDictionary *dict;
@property (nonatomic, assign) id<FirstTableViewCellDelegate> delegate;

+ (CGFloat)getCellHeight:(NSDictionary *)dic;


@end
