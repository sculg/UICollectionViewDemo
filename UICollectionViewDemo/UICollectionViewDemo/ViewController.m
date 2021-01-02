//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by lg on 2021/1/1.
//

#import "ViewController.h"
#import "UICollectionPageLayout.h"
#import "UICollectionViewPageCell.h"
#import "UICollectionPageLayout.h"
#import <Masonry/Masonry.h>

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UICollectionPageLayout *pageLayout;

@property (nonatomic, strong) NSMutableArray<NSString *> *dataArr;

@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    _dataArr = [NSMutableArray new];
    for (int i = 0; i<50; i++) {
        [_dataArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    [self setupSubView];
}

- (void)setupSubView {
    [self.view addSubview:self.pageControl];
    self.pageControl.currentPage = 0;
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).mas_offset(-60);
        make.height.equalTo(@30);
    }];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewPageCell class]) forIndexPath:indexPath];
    [cell setUpWithNum:self.dataArr[indexPath.row]];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat doublePage = scrollView.contentOffset.x/self.view.bounds.size.width;
    int pageNum = (int)(doublePage + 0.5);
    self.pageControl.currentPage = pageNum;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height - 100 * 2) collectionViewLayout:self.pageLayout
                           ];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[UICollectionViewPageCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewPageCell class])];
    }
    return _collectionView;
}

- (UICollectionPageLayout *)pageLayout {
    if (!_pageLayout) {
        _pageLayout  = [[UICollectionPageLayout alloc] init];
        _pageLayout.minimumInteritemSpacing = 0;
        _pageLayout.minimumLineSpacing = 0;
        _pageLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return  _pageLayout;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
            _pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
            _pageControl.hidesForSinglePage = YES;
            _pageControl.numberOfPages = (_dataArr.count % 9 == 0) ? (_dataArr.count/9): (_dataArr.count/9) + 1;
            _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
            _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
            _pageControl.backgroundColor = [UIColor clearColor];
            _pageControl.userInteractionEnabled = NO;
        }
    return _pageControl;
}

@end
