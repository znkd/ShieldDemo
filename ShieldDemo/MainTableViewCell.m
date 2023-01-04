//
//  MainTableViewCell.m
//  ShieldDemo
//
//  Created by eric on 2021/9/29.
//

#import "MainTableViewCell.h"

@implementation MainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithMainCellStyle:(NSInteger)style reuseIdentifier:(NSString*)identifier indexPath:(nonnull NSIndexPath *)indexPath
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier]) {
        int hight = [self setupUI:style indexPath:indexPath];
        
        if(hight != 44) {
            self.bounds = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, hight);
            NSLayoutConstraint inse
        }
        
    }
    
    return self;
}

- (NSInteger)setupUI:(NSInteger)style indexPath:(nonnull NSIndexPath *)indexPath {
    if (style == 1) {
        NSInteger index = indexPath.row;
        UILabel* cellLabel = [[UILabel alloc]initWithFrame:(CGRect)self.contentView.bounds];
        [cellLabel setText:@"11"/*self.demoStylesArr[index]*/];
        [self addSubview:cellLabel];
        self.selectionStyle = UITableViewCellSelectionStyleBlue;//UITableViewCellSelectionStyleNone;
        
//        UIAction* btnAction = [UIAction actionWithTitle:@"ok" image:nil identifier:UIAction.cl handler:^(__kindof UIAction * _Nonnull action) {
//            NSLog(@"cell btn clicked");
//        }];
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 60, 50, 50);
        [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        [btn.titleLabel setText:@"aaaa"];
        [btn setTitle:@"bbbb" forState:UIControlStateNormal];
        [self addSubview:btn];
        return cellLabel.bounds.size.height + btn.bounds.size.height ;
    }
    
    return 44;
}
@end
