import os

file_name = 'random.bin'

with open(file_name, 'wb') as f:
    # 生成随机字节
    random_data = os.urandom(256)  # 生成 256 字节的随机数据
    f.write(random_data)

print(f"Binary file created successfully: {file_name}")
