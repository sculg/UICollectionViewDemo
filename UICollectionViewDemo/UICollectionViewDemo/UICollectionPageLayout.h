//
//  UICollectionPageLayout.h
//  UICollectionViewDemo
//
//  Created by lg on 2021/1/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionPageLayout : UICollectionViewFlowLayout
/** 列间距 */
@property (nonatomic, assign) CGFloat columnSpacing;
/** 行间距 */
@property (nonatomic, assign) CGFloat rowSpacing;
/** collectionView的内边距 */
@property (nonatomic, assign) UIEdgeInsets edgeInsets;
/** 多少行 */
@property (nonatomic, assign) NSInteger rowCount;
/** 每行展示多少个item */
@property (nonatomic, assign) NSInteger itemCountPerRow;
/** 所有item的属性数组 */
@property (nonatomic, strong) NSMutableArray *attributesArrayM;

@end

NS_ASSUME_NONNULL_END
