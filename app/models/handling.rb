class Handling < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '1~2日に発送' },
    { id: 2, name: '2~3日目に発送' },
    { id: 3, name: '4~7日目に発送' }
  ]
end
