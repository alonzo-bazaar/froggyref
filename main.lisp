(let ((camera (raylib:make-camera-3d :position (raylib:make-vector3 :x 10.0 :y 10.0 :z 10.0)
                                     :target (raylib:vector3-zero)
                                     :up (raylib:make-vector3 :x 0.0 :y 1.0 :z 0.0)
                                     :fovy 33.3 :projection #.(cffi:foreign-enum-value 'raylib:camera-projection :perspective)))
      (position (raylib:vector3-zero)))
  (raylib:with-window ("Simple Model Viewer" (1280 720))
    (loop :until (raylib:window-should-close)
          :do (raylib:with-drawing
                (raylib:update-camera camera #.(cffi:foreign-enum-value 'raylib:camera-mode :free))
                (raylib:with-mode-3d camera
                  (raylib:clear-background raylib:+red+)
                  (raylib:draw-grid 100 0.5)
                  (rlgl:disable-backface-culling)
                  (rlgl:enable-backface-culling))))))e
