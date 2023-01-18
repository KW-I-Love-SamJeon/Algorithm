#rosbag play /*파일경로*/ --clock
# bag파일 병합
# 구체적인 bag dataset을 적용할거면 *지우고 특정이름 사용
# --clock 필수 !

#rosservice를 통해서 mesh 생성
#결과는 /home/rhee/catkin_ws/src/Kimera-Semantics/kimera_semantics_ros/mesh_results 에 존재
rosbag play /home/rhee/dataset/* --clock
rosservice call /kimera_semantics_node/generate_mesh