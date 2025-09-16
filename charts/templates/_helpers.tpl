
{{- define "go-echoce2dd34c-fdf7-499f-9a2d-a21d4af06927.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce2dd34c-fdf7-499f-9a2d-a21d4af06927.fullname" -}}
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


{{- define "go-echoce2dd34c-fdf7-499f-9a2d-a21d4af06927.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce2dd34c-fdf7-499f-9a2d-a21d4af06927.labels" -}}
helm.sh/chart: {{ include "go-echoce2dd34c-fdf7-499f-9a2d-a21d4af06927.chart" . }}
{{ include "go-echoce2dd34c-fdf7-499f-9a2d-a21d4af06927.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce2dd34c-fdf7-499f-9a2d-a21d4af06927.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce2dd34c-fdf7-499f-9a2d-a21d4af06927.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}