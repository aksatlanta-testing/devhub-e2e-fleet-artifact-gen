
{{- define "go-echo22de6d27-1bb9-4e52-b792-7d93c3f2061a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo22de6d27-1bb9-4e52-b792-7d93c3f2061a.fullname" -}}
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


{{- define "go-echo22de6d27-1bb9-4e52-b792-7d93c3f2061a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo22de6d27-1bb9-4e52-b792-7d93c3f2061a.labels" -}}
helm.sh/chart: {{ include "go-echo22de6d27-1bb9-4e52-b792-7d93c3f2061a.chart" . }}
{{ include "go-echo22de6d27-1bb9-4e52-b792-7d93c3f2061a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo22de6d27-1bb9-4e52-b792-7d93c3f2061a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo22de6d27-1bb9-4e52-b792-7d93c3f2061a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}