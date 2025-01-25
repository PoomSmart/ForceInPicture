#import <string.h>

%config(generator=MobileSubstrate)

extern "C" bool _os_feature_enabled_impl(const char *domain, const char *feature);
%hookf(bool, _os_feature_enabled_impl, const char *domain, const char *feature) {
    if (strcmp(domain, "SpringBoard") == 0 && strcmp(feature, "PictureInPicture") == 0) {
        return true;
    }
    return %orig;
}
