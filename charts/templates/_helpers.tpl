
{{- define "go-echo4ef21c3d-9c6e-4e46-9d1d-d7df9876942e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4ef21c3d-9c6e-4e46-9d1d-d7df9876942e.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo4ef21c3d-9c6e-4e46-9d1d-d7df9876942e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo4ef21c3d-9c6e-4e46-9d1d-d7df9876942e.labels" -}}
helm.sh/chart: {{ include "go-echo4ef21c3d-9c6e-4e46-9d1d-d7df9876942e.chart" . }}
{{ include "go-echo4ef21c3d-9c6e-4e46-9d1d-d7df9876942e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo4ef21c3d-9c6e-4e46-9d1d-d7df9876942e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo4ef21c3d-9c6e-4e46-9d1d-d7df9876942e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}