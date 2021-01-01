//
//  UICollectionViewPageCell.m
//  UICollectionViewDemo
//
//  Created by lg on 2021/1/1.
//

#import "UICollectionViewPageCell.h"

@interface  UICollectionViewPageCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation UICollectionViewPageCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self setupSubview];
    }
    return  self;
}

- (void)setupSubview {
    [self.contentView addSubview:self.titleLabel];
}

- (void)setUpWithNum:(NSString *)num{
    self.titleLabel.text = num;
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width-40)*0.5, (self.frame.size.height-30)*0.5, 40, 30)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end
