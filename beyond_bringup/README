# G2 lidar 세팅
## version: ubuntu 22.04, ros2 humble

### src에 들어가서 git clone
    
    ```jsx
    git clone https://github.com/PinkWink/YDLidar-SDK.git
    
    ```
    
### ydlidar install
    
    git clone -b https://github.com/kwongeunwoo/kwon-demo-repository.git
    

### 그 후 {$workspace_path}로 이동
    
    ```jsx
    cd {$workspace_path}/src/YDLidar-SDK
    cd build
    cmake ..
    make
    sudo make install
    ```
    
### {$workspace_path}로 이동, cbs, sb

### 다시 {$workspace_path}로 이동
    
    ```jsx
    chmod 0777 src/ydlidar_ros2_driver_bs/startup/*
    sudo sh src/ydlidar_ros2_driver_bs/startup/initenv.sh
    
    + Replug !!!!!!!!!!!
    ```
    

## scan 토픽 명 바꾸는 법 → ydlidar_ros2_driver_bs→src안에 있는 cpp파일 모두 아래 같이 있는데

```jsx
auto laser_pub = node->create_publisher<sensor_msgs::msg::LaserScan>("scan1", rclcpp::SensorDataQoS());
```

```
auto lidar_info_sub = node->create_subscription<sensor_msgs::msg::LaserScan>(
                        "scan1", rclcpp::SensorDataQoS(), scanCb);
```

scan → scan1으로 바꾼거임
