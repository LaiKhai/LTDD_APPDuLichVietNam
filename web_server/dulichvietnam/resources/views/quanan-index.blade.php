@extends('layouts.app')
@section('title')
Danh sách thông tin quán ăn
@endsection
@section('content-wrapper')
@parent
<div class="page-header">
    <h3 class="page-title">@yield('title')</h3>
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Dashboar</a></li>
            <li class="breadcrumb-item active" aria-current="page">Thông tin quán ăn</li>
        </ol>
    </nav>
</div>
<div class="row">
    <div class="col-lg-12 grid-margin stretch-card">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Thông tin quán ăn</h4>
                </p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class="text-center"> ID </th>
                            <th class="text-center"> Hình ảnh</th>
                            <th class="text-center"> Tên Lưu Trú </th>
                            <th class="text-center"> Địa Chỉ </th>
                            <th class="text-center"> Thuộc địa danh</th>
                            <th class="text-center"> Trạng thái </th>
                            <th class="text-center"> Chức năng </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($lstquanan as $quanan)
                        <tr>
                            <td class="text-center">{{$quanan->id}}</td>
                            <td class="py-1">
                                <img src="{{$quanan->hinhanh}}" alt="image"
                                    style="width:50px; max-height:200px;object-fit:contain;" />
                            </td>
                            <td class="text-center">{{$quanan->ten}}</td>
                            <td>
                                <div style="width: 300px;
                                    white-space: normal;">{{$quanan->diachi}}</div>
                            </td>
                            <td class="text-center">@foreach ($diaDanh as $item)
                                {{$item->tendiadanh}}
                                @endforeach</td>
                            <td class="text-center">
                                @if ($quanan->trangthai==1)
                                <span class="badge bg-success text-white">Tồn tại</span>
                                @endif
                                @if ($quanan->trangthai==0)
                                <span class="badge bg-danger text-white">Đã xóa</span>
                                @endif
                                @if ($quanan->trangthai==2)
                                <span class="badge bg-warning text-white">Đang xử lí</span>
                                @endif
                            </td>
                            <td class="text-center">
                                <a type="button" class="btn btn-outline-warning"
                                    href="{{route('quanan.show',['quanan'=>$quanan])}}">chi
                                    tiết</a>
                                <a type="button" class="btn btn-outline-success"
                                    href="{{route('quanan.edit',['quanan'=>$quanan])}}">Sửa</a>
                            </td>
                            <td class="text-center">
                                <form method="POST" action="{{route('quanan.destroy',['quanan'=>$quanan])}}">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-outline-danger">Xóa</button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection