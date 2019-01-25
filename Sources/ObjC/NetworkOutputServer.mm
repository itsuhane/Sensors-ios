#import "NetworkOutputServer.h"
#import "NetworkOutputServerImpl.hpp"

@implementation NetworkOutputServer

ServerImpl *impl;

-(nullable instancetype)init:(NSString*)address{
    if(self = [super init]) {
        try {
            impl = new ServerImpl([address UTF8String]);
        } catch(...) {
            return nil;
        }
    }
    return self;
}

-(void)dealloc {
    delete impl;
}

-(void)send:(const void*)data maxLength:(long)length {
    impl->send(data, length);
}

@end
