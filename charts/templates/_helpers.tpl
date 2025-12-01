
{{- define "go-echo974c096a-1ae0-4d07-b35b-208d7bb20e2a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo974c096a-1ae0-4d07-b35b-208d7bb20e2a.fullname" -}}
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


{{- define "go-echo974c096a-1ae0-4d07-b35b-208d7bb20e2a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo974c096a-1ae0-4d07-b35b-208d7bb20e2a.labels" -}}
helm.sh/chart: {{ include "go-echo974c096a-1ae0-4d07-b35b-208d7bb20e2a.chart" . }}
{{ include "go-echo974c096a-1ae0-4d07-b35b-208d7bb20e2a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo974c096a-1ae0-4d07-b35b-208d7bb20e2a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo974c096a-1ae0-4d07-b35b-208d7bb20e2a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}