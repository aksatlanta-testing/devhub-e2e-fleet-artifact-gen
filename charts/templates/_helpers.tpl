
{{- define "go-echo05c38a74-5fcb-4eaf-8e1e-339e7c22d12b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05c38a74-5fcb-4eaf-8e1e-339e7c22d12b.fullname" -}}
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


{{- define "go-echo05c38a74-5fcb-4eaf-8e1e-339e7c22d12b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo05c38a74-5fcb-4eaf-8e1e-339e7c22d12b.labels" -}}
helm.sh/chart: {{ include "go-echo05c38a74-5fcb-4eaf-8e1e-339e7c22d12b.chart" . }}
{{ include "go-echo05c38a74-5fcb-4eaf-8e1e-339e7c22d12b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo05c38a74-5fcb-4eaf-8e1e-339e7c22d12b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo05c38a74-5fcb-4eaf-8e1e-339e7c22d12b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}