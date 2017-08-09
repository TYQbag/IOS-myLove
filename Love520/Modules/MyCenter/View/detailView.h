//
//  detailView.h
//  Love520
//
//  Created by 唐亚倩 on 17/6/2.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol detailDelegate <NSObject>


-(void)clickBtn:(NSInteger )tag;

@end

@interface detailView : UIView

@property(nonatomic,assign)id <detailDelegate>delegate;


@end
