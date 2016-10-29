;;; chinese-pyim-wbdict.el --- Some wubi dicts for chinese-pyim

;; * Header
;; Copyright (C) 2016 Feng Shu <tumashu@163.com>

;; Author: Feng Shu <tumashu@163.com>
;; URL: https://github.com/tumashu/chinese-pyim-wbdict
;; Version: 0.0.1
;; Keywords: convenience, Chinese, pinyin, input-method, complete

;;; License:

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;; * chinese-pyim-wbdict README                         :README:doc:

;; ** 简介
;; Chinese-pyim-wbdict 是 chinese-pyim 的一个五笔词库，词库源于 emacs-eim.

;; ** 安装和使用
;; 1. 配置melpa源，参考：http://melpa.org/#/getting-started
;; 2. M-x package-install RET chinese-pyim-wbdict RET
;; 3. 在emacs配置文件中（比如: ~/.emacs）添加如下代码：
;;    #+BEGIN_EXAMPLE
;;    (require 'chinese-pyim-wbdict)
;;    (chinese-pyim-wbdict-gb2312-enable) ; gb2312 version
;;    ;; (chinese-pyim-wbdict-gbk-enable) ; gbk version
;;    #+END_EXAMPLE

;;; Code:
;; * 代码                                                               :code:
;; #+BEGIN_SRC emacs-lisp

;;;###autoload
(defun chinese-pyim-wbdict-gb2312-enable ()
  "Add wbdict-gb2312 to chinese-pyim."
  (interactive)
  (let* ((dir (file-name-directory
               (locate-library "chinese-pyim-wbdict.el")))
         (file (concat dir "pyim-wbdict-gb2312.pyim")))
    (when (file-exists-p file)
      (if (featurep 'chinese-pyim)
          (pyim-extra-dicts-add-dict
           `(:name "wbdict-gb2312-elpa" :file ,file :elpa t))
        (message "Chinese-pyim 没有安装，chinese-pyim-wbdict 启用失败。")))))

;;;###autoload
(defun chinese-pyim-wbdict-gbk-enable ()
  "Add wbdict-gbk to chinese-pyim."
  (interactive)
  (let* ((dir (file-name-directory
               (locate-library "chinese-pyim-wbdict.el")))
         (file (concat dir "pyim-wbdict-gbk.pyim")))
    (when (file-exists-p file)
      (if (featurep 'chinese-pyim)
          (pyim-extra-dicts-add-dict
           `(:name "wbdict-gbk-elpa" :file ,file :elpa t))
        (message "Chinese-pyim 没有安装，chinese-pyim-wbdict 启用失败。")))))
;; #+END_SRC

;; * Footer

;; #+BEGIN_SRC emacs-lisp
(provide 'chinese-pyim-wbdict)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; chinese-pyim-wbdict.el ends here
;; #+END_SRC
