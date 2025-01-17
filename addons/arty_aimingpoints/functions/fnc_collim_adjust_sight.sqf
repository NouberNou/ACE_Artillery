/*
 * Author: p1nga
 *
 * Toggle Aim Down Collimator Iron Sights.
 *
 * Argument:
 * 0: Any object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"
params ["_collimator"];
private ["_pos","_camera","_align_H", "_align_V"];

diag_log _collimator;

_pos = _collimator modelToWorld (_collimator selectionPosition "eye");
_camera = "camera" camCreate _pos;
_camera cameraEffect ["internal", "back"];
_camera camSetTarget (_collimator modelToWorld (_collimator selectionPosition "look"));
/*opticsZoomMin = 0.25;
opticsZoomMax = 1.25;
opticsZoomInit = 0.75;*/
_camera camSetFovRange [0.25, 1.25];
_camera camSetFov 0.75;
_camera camCommit 0.1;

showCinemaBorder false;
_align_H = _collimator animationPhase "collimator_rotation";
_align_V = _collimator animationPhase "collimator_elevation";
