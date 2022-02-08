@extends('layouts.app')
@section('title')
Danh sách thông tin món ăn
@endsection
@section('content-wrapper')
@parent
<div class="col-md-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Chỉnh địa danh</h4>
            @foreach ($lstvungmien as $item)
            <form class="forms-sample" method="post" action="{{route('vungmien.update',['vungmien'=>$item])}}"
                enctype="multipart/form-data">
                @csrf
                @method('PATCH')
                <div class="form-group row">
                    <label for="exampleInputEmail2" class="col-sm-3 col-form-label">Tên vùng miền</label>
                    <div class="col-sm-9">
                        <input type="text" name="tenvungmien" class="form-control" id="exampleInputEmail2"
                            value="{{$item->tenvungmien}}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="exampleInputConfirmPassword2" class="col-sm-3 col-form-label">Trạng Thái</label>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="1"
                            {{$item->trangthai=='1'?'checked':''}}> <span class="badge bg-success text-white">Tồn
                            tại</span>
                    </div>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="2"
                            {{$item->trangthai=='2'?'checked':''}}> <span
                            class="badge bg-warning text-white text-white"> Chờ duyệt</span>
                    </div>
                    <div class="col-sm-3">
                        <input type="checkbox" name="trangthai" class="form-check-input pl-2" value="3"
                            {{$item->trangthai=='2'?'checked':''}}> <span
                            class="badge bg-danger text-white text-white">Đã duyệt</span>
                    </div>
                </div>
                @endforeach
                <button type="submit" class="btn btn-success mr-2">Sửa</button>
                <a type="button" class="btn btn-outline-primary" href="{{route('diadanh.index')}}">Quay lại</a>
            </form>
        </div>
    </div>
</div>
@endsection