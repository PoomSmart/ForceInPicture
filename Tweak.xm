#import <PSHeader/Misc.h>
#import <CoreFoundation/CoreFoundation.h>

%config(generator=MobileSubstrate)

extern "C" bool MGGetBoolAnswer(CFStringRef);
%hookf(bool, MGGetBoolAnswer, CFStringRef key) {
    if (CFStringEqual(key, CFSTR("nVh/gwNpy7Jv1NOk00CMrw")))
        return YES;
    return %orig;
}
