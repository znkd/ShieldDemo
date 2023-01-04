//
//  MainTableViewCell.h
//  ShieldDemo
//
//  Created by eric on 2021/9/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainTableViewCell : UITableViewCell
//0:default
//1:with one button
- (instancetype)initWithMainCellStyle:(NSInteger)style  reuseIdentifier:(NSString*)identifier indexPath:(nonnull NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
