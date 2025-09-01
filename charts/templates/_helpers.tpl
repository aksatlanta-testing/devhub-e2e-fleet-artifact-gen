
{{- define "go-echo56c1fb4c-5f1a-4d23-a8dd-2d040e355d83.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo56c1fb4c-5f1a-4d23-a8dd-2d040e355d83.fullname" -}}
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


{{- define "go-echo56c1fb4c-5f1a-4d23-a8dd-2d040e355d83.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo56c1fb4c-5f1a-4d23-a8dd-2d040e355d83.labels" -}}
helm.sh/chart: {{ include "go-echo56c1fb4c-5f1a-4d23-a8dd-2d040e355d83.chart" . }}
{{ include "go-echo56c1fb4c-5f1a-4d23-a8dd-2d040e355d83.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo56c1fb4c-5f1a-4d23-a8dd-2d040e355d83.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo56c1fb4c-5f1a-4d23-a8dd-2d040e355d83.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}