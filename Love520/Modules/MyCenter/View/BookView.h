//
//  BookView.h
//  Love520
//
//  Created by 唐亚倩 on 17/7/14.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookView : UIView


@property (nonatomic, strong) NSDictionary *data;
@property NSInteger pages;

- (id)initWithFrame:(CGRect)frame pages:(NSInteger)page data:(NSDictionary *)data;

@end
