
{{- define "go-echo05250138-d241-4500-a858-f07970059fef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05250138-d241-4500-a858-f07970059fef.fullname" -}}
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


{{- define "go-echo05250138-d241-4500-a858-f07970059fef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05250138-d241-4500-a858-f07970059fef.labels" -}}
helm.sh/chart: {{ include "go-echo05250138-d241-4500-a858-f07970059fef.chart" . }}
{{ include "go-echo05250138-d241-4500-a858-f07970059fef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo05250138-d241-4500-a858-f07970059fef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo05250138-d241-4500-a858-f07970059fef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}