//
//  FirstTableViewCell.m
//  TestAutoLayout003
//
//  Created by dev on 15/5/22.
//  Copyright (c) 2015年 dev. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _photoImage = [UIImageView new];
        _photoImage.frame = CGRectMake(15, 10, 60, 60);
        _photoImage.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_photoImage];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.numberOfLines = 0;
        _titleLabel.frame = CGRectMake(90, 10, SCREEN_WIDTH - 175, 20);
        _titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLabel];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.numberOfLines = 0;
        _contentLabel.frame = CGRectMake(90, _titleLabel.bottom + 5, SCREEN_WIDTH - 175, 20);
        _contentLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:_contentLabel];
        
        _detaileButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _detaileButton.backgroundColor = [UIColor yellowColor];
        _detaileButton.frame = CGRectMake(_titleLabel.right + 10, 20, 60, 30);
        [_detaileButton setTitle:@"detail" forState:UIControlStateNormal];
        [_detaileButton addTarget:self action:@selector(detailButton) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_detaileButton];
    }
    return self;
}

- (void)detailButton
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickDetailButton:)]) {
        [self.delegate clickDetailButton:self];
    }
}

- (void)setDict:(NSDictionary *)dict
{
    _dict = dict;
    if (dict) {
        _titleLabel.text   = dict[@"title"];
        _contentLabel.text = dict[@"content"];
        
#pragma mark - 实现Label的自适应宽高度
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16.], NSFontAttributeName, nil];
        CGSize size1 = [dict[@"title"] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 175, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic1 context:nil].size;
        _titleLabel.frame  = CGRectMake(90, 10, SCREEN_WIDTH - 175, size1.height);
        
        NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], NSFontAttributeName, nil];
        CGSize size2 = [dict[@"content"] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 175, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic2 context:nil].size;
        _contentLabel.frame = CGRectMake(90, _titleLabel.bottom + 5, SCREEN_WIDTH - 175, size2.height);
        _detaileButton.frame = CGRectMake(_titleLabel.right + 10, 20, 60, 30);
    }
}

#pragma mark - 实现Label的自适应宽高度
+ (CGFloat)getCellHeight:(NSDictionary *)dic
{
    CGSize size1, size2;
    if (dic) {
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16.], NSFontAttributeName, nil];
        size1 = [dic[@"title"] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 175, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic1 context:nil].size;
        
        NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], NSFontAttributeName, nil];
        size2 = [dic[@"content"] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH - 175, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic2 context:nil].size;
    }
    return size2.height + size1.height + 30;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
