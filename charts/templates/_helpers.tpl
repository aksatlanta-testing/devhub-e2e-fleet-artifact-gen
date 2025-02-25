
{{- define "go-echo6b79e2a6-825c-4751-b8fb-717f18afa6ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6b79e2a6-825c-4751-b8fb-717f18afa6ac.fullname" -}}
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


{{- define "go-echo6b79e2a6-825c-4751-b8fb-717f18afa6ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6b79e2a6-825c-4751-b8fb-717f18afa6ac.labels" -}}
helm.sh/chart: {{ include "go-echo6b79e2a6-825c-4751-b8fb-717f18afa6ac.chart" . }}
{{ include "go-echo6b79e2a6-825c-4751-b8fb-717f18afa6ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6b79e2a6-825c-4751-b8fb-717f18afa6ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6b79e2a6-825c-4751-b8fb-717f18afa6ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}