

#import <UIKit/UIKit.h>
#import "SMS_SDK/CountryAndAreaCode.h"

@protocol SecondViewControllerDelegate;

@interface SectionsViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate>
{
    UITableView *table;
    UISearchBar *search;
    NSDictionary *allNames;
    NSMutableDictionary *names;
    NSMutableArray  *keys;    
    
    BOOL    isSearching;
}
@property (nonatomic, strong)  UITableView *table;
@property (nonatomic, strong)  UISearchBar *search;
@property (nonatomic, strong) NSDictionary *allNames;
@property (nonatomic, strong) NSMutableDictionary *names;
@property (nonatomic, strong) NSMutableArray *keys;
- (void)resetSearch;
- (void)handleSearchForTerm:(NSString *)searchTerm;

@property (nonatomic, strong) id<SecondViewControllerDelegate> delegate;

@property(nonatomic,strong)  UIToolbar* toolBar;

-(void)setAreaArray:(NSMutableArray*)array;

@end

@protocol SecondViewControllerDelegate <NSObject>
- (void)setSecondData:(CountryAndAreaCode *)data;
@end


