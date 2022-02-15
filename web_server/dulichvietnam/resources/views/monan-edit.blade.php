@extends('layouts.app')
@section('title')
Chỉnh sửa thông tin món ăn
@endsection
@section('content-wrapper')
@parent
<div class="col-md-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Chỉnh sửa món ăn</h4>
            <form class="forms-sample" method="post" action="{{route('monan.update',['monan'=>$monan])}}"
                enctype="multipart/form-data">
                @csrf
                @method('PATCH')
                <div class="form-group row">
                    <label for="exampleInputUsername2" class="col-sm-3 col-form-label">ID</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" name="id" id="exampleInputUsername2"
                            value="{{$monan->id}}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Tên</label>
                    <div class="col-sm-9">
                        <input type="text" name="ten" class="form-control" id="exampleInputEmail2"
                            value="{{$monan->ten}}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Mô tả</label>
                    <div class="col-sm-9">
                        <textarea row="10" cols="40" class="form-control" id="exampleInputMobile"
                            name="mota">{{$monan->mota}}</textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputPassword2" class="col-sm-3 col-form-label">Thuộc địa danh</label>
                    <div class="col-sm-9">
                        <select class="form-control" id="exampleSelectGender" name="dia_danhs_id">
                            @foreach ($lstdiadanh as $diadanh)
                            <option value="{{$diadanh->id}}">{{$diadanh->tendiadanh}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputMobile" class="col-sm-3 col-form-label">Hình ảnh</label>
                    <div class="col-sm-9">
                        <img src="{{$monan->hinhanh}}" style="width:200px; max-height:200px;object-fit:contain;" alt="">
                        <p></p>
                        <input type="file" name="hinhanh" accept="image/*" class="form-control file-upload-info"
                            placeholder="Upload Image">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Trạng Thái</label>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="1"
                            {{$monan->trangthai=='1'?'checked':''}}> <span class="badge bg-success text-white">Tồn
                            tại</span>
                    </div>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="2"
                            {{$monan->trangthai=='2'?'checked':''}}> <span
                            class="badge bg-warning text-white text-white"> Chờ duyệt</span>
                    </div>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="3"
                            {{$monan->trangthai=='2'?'checked':''}}> <span
                            class="badge bg-danger text-white text-white">Đã duyệt</span>
                    </div>
                </div>
                <button type="submit" class="btn btn-success mr-2">Sửa</button>
                <a type="button" class="btn btn-outline-primary" href="{{route('diadanh.index')}}">Quay lại</a>
            </form>
        </div>
    </div>
</div>
@endsection