//
//  ViewController.m
//  AFNetworking
//
//  Created by Tecksky Techonologies on 12/23/16.
//  Copyright © 2016 Tecksky Technologies. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getRequest:(id)sender
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://runmile.com/api/web/v1/user/adon" parameters:nil progress:nil success:^(NSURLSessionTask *task , id response)
    {
        NSMutableArray *availabel_locale = [[response valueForKey:@"data"] valueForKey:@"availabel_locale"];
        for (int i =0; i<[availabel_locale count]; i++) {
            NSMutableDictionary *locale = [availabel_locale objectAtIndex:i];
             NSString *value = [[availabel_locale objectAtIndex:i] valueForKey:@"value"];
            NSLog(@"get = %@",locale);
        }
        
    } failure:^(NSURLSessionTask *task , NSError *error)
    {
    }];
}
- (IBAction)postRequest:(id)sender
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:@"devvtecksky@gmail.com" forKey:@"email"];
    [param setValue:@"123456" forKey:@"password"];
    
    NSMutableDictionary *device = [[NSMutableDictionary alloc] init];
    [device setValue:@"1234567890" forKey:@"udid"];
    [device setValue:@"1234567890" forKey:@"token"];
    [device setValue:@"tablet" forKey:@"type"];
    [device setValue:@"iphone" forKey:@"os"];
    
    [param setValue:device forKey:@"device"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://runmile.com/api/web/v1/user/login" parameters:param progress:nil success:^(NSURLSessionTask *task , id response){
        NSLog(@"Post = %@",response);
    }
    failure:^(NSURLSessionTask *task , NSError *error){
    }];
}
- (IBAction)postWithAuth:(id)sender
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:@"surat" forKey:@"from_address"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"VVb419EerxCnpQfGv0pkJsKa84Fj1WzngxPJRvce" forHTTPHeaderField:@"TeckskyAuth"];
    [manager POST:@"http://runmile.com/api/web/v1/trip/search" parameters:param progress:nil success:^(NSURLSessionTask *task , id response){
        NSLog(@"Post with Auth = %@",response);
    }
    failure:^(NSURLSessionTask *task , NSError *error){
    }];
}
- (IBAction)deleteRequest:(id)sender
{
    NSMutableDictionary *param = [[NSMutableDictionary alloc] init];
    [param setValue:@"1" forKey:@"id"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"VVb419EerxCnpQfGv0pkJsKa84Fj1WzngxPJRvce" forHTTPHeaderField:@"TeckskyAuth"];
    manager.requestSerializer.HTTPMethodsEncodingParametersInURI = nil;
    [manager DELETE:@"http://runmile.com/api/web/v1/parts/delete" parameters:param success:^(NSURLSessionTask *task , id response)
    {
        NSLog(@"Delete = %@",response);
    }
    failure:^(NSURLSessionTask *task ,NSError *error)
    {
    }];
}

@end
