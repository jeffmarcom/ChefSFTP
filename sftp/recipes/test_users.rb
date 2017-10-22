# Copyright [2017] [Jeff Marcom]
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

sftp_user 'test-user-1' do
  username 'player1'
  password '$1$9U6ztmMK$bMHdynxGZcbOlAqD1jEq71'
  group 'sftp'
  upload_dir '/home/player1/upload'
end

sftp_user 'test-user-2' do
  username 'player2'
  password '$1$9U6ztmMK$bMHdynxGZcbOlAqD1jEq71'
  group 'sftp'
  upload_dir '/home/player2/upload'
end
