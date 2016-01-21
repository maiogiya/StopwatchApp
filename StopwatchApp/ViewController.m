//
//  ViewController.m
//  StopwatchApp
//
//  Created by 扇谷真依 on 2016/01/15.
//  Copyright © 2016年 扇谷真依. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

// 時刻を表示するためのラベルインスタンスを格納するための変数
UILabel *timeLabel;

NSTimer *timer;

int second;
int minute;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    [super viewDidLoad];
    
    // ラベルを作成
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    
    // ラベルの位置を中心で設定
    timeLabel.center = CGPointMake(160, 284);
    
    // ラベルに表示するフォントと文字サイズの設定
    timeLabel.font = [UIFont fontWithName:@"HiraKakuProN-W6" size:48];
    
    // ラベルに表示する文字を設定
    timeLabel.text = @"00:00";
    
    // ラベルの文字寄せを設定
    timeLabel.textAlignment = NSTextAlignmentCenter;
    
    // ラベルの背景色を透明に設定
    timeLabel.backgroundColor = [UIColor clearColor];
    
    // ラベルを画面に貼付ける
    [self.view addSubview:timeLabel];
    
    // ボタンの作成
    UIButton *resetbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // ボタンの位置を設定
    resetbutton.frame = CGRectMake(0, 0, 60, 60);
    resetbutton.center = CGPointMake(120, 400);
    
    [resetbutton setImage:[UIImage imageNamed:@"reset.png"] forState:UIControlStateNormal];
    
    // ボタンを押したときに呼ばれるメソッドを設定
    [resetbutton addTarget:self action:@selector(timerReset:)
     forControlEvents:UIControlEventTouchUpInside];
    
    // ボタンを画面に貼付ける
    [self.view addSubview:resetbutton];
    
    // ボタンの作成
    UIButton *startbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // ボタンの位置を設定
    startbutton.frame = CGRectMake(0, 0, 60, 60);
    startbutton.center = CGPointMake(200, 400);
    
    [startbutton setImage:[UIImage imageNamed:@"start.png"] forState:UIControlStateNormal];
    
    // ボタンのタイトルを設定
    [startbutton setTitle:@"停止" forState:UIControlStateNormal];
    
    // ボタンを押したときに呼ばれるメソッドを設定
    [startbutton addTarget:self action:@selector(timerStart:)
         forControlEvents:UIControlEventTouchUpInside];
    
    
    
    // ボタンを画面に貼付ける
    [self.view addSubview:startbutton];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addTime {
    second++;
    
    if (second >= 60) {
        second = 0;
        minute++;
    }
    NSLog(@"%d second %d minute", second, minute);
    timeLabel.text = [NSString stringWithFormat:@"%02d:%02d",minute,second];
}

- (void) timerReset:(id)sender{
    if (timer == nil){
        timeLabel.text = @"00:00";
        timer = nil;
        minute = 0;
        second = 0;
    }
}

-(void)timerStart:(id)sender{
    UIButton *btn = (UIButton*) sender;
    if (timer == nil){
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                 target:self
                                               selector:@selector(addTime)
                                               userInfo:nil
                                                repeats:YES];
        [btn setImage:[UIImage imageNamed:@"stop.png"] forState:UIControlStateNormal];
    }else{
        [timer invalidate];
        timer = nil;
        [btn setImage:[UIImage imageNamed:@"start.png"] forState:UIControlStateNormal];
        
    }

}

@end
