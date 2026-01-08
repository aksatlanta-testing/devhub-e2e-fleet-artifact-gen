
{{- define "go-echo1757b391-3f11-4ca8-95af-ec7cfcc4dded.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1757b391-3f11-4ca8-95af-ec7cfcc4dded.fullname" -}}
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


{{- define "go-echo1757b391-3f11-4ca8-95af-ec7cfcc4dded.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1757b391-3f11-4ca8-95af-ec7cfcc4dded.labels" -}}
helm.sh/chart: {{ include "go-echo1757b391-3f11-4ca8-95af-ec7cfcc4dded.chart" . }}
{{ include "go-echo1757b391-3f11-4ca8-95af-ec7cfcc4dded.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1757b391-3f11-4ca8-95af-ec7cfcc4dded.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1757b391-3f11-4ca8-95af-ec7cfcc4dded.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}