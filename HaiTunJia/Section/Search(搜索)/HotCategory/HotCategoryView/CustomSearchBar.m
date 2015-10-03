#import "CustomSearchBar.h"


@interface CustomSearchBar ()
<UISearchBarDelegate>
@property(nonatomic,strong) UISearchBar *searchBar;

@end

@implementation CustomSearchBar

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.searchBar];
    }
    return self;
}

-(UISearchBar *) searchBar
{
    if (!_searchBar)
    {
        _searchBar= [[UISearchBar alloc]initWithFrame:CGRectMake(0  ,0,self.width, self.height)];
        _searchBar.placeholder = @"输入搜索关键字";
        _searchBar.backgroundImage = [UIImage createImageWithColor:[UIColor clearColor] rect:_searchBar.bounds];
        _searchBar.delegate = self;
        UITextField *searchField = [_searchBar valueForKey:@"_searchField"];
        searchField.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
        searchField.textColor = [UIColor colorWithHexString:@"666666"];
    }
    return _searchBar;
}

#pragma mark -- UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    if (![searchBar.text isEqualToString:@""])
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(getSearchKeyword:)])
            [self.delegate getSearchKeyword:searchBar.text];
    }
}
@end
