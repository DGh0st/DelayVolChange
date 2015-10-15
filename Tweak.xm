@interface VolumeControl
-(void)increaseVolume;
-(void)decreaseVolume;
-(BOOL)_isVolumeHUDVisible;
-(void)_changeVolumeBy:(float)arg1;
-(float)volume;
-(BOOL)_isMusicPlayingSomewhere;
@end

%hook VolumeControl
-(void)increaseVolume{
	if([self _isVolumeHUDVisible] || [self _isMusicPlayingSomewhere]){
		%orig;
	} else {
		[self _changeVolumeBy:0.0f];
	}
}
-(void)decreaseVolume{
	if([self _isVolumeHUDVisible] || [self _isMusicPlayingSomewhere]){
		%orig;
	} else {
		[self _changeVolumeBy:0.0f];
	}
}
-(void)_changeVolumeBy:(float)arg1{
	if([self _isVolumeHUDVisible] || [self _isMusicPlayingSomewhere]){
		%orig;
	} else {
		%orig(0.0f);
	}
}
%end