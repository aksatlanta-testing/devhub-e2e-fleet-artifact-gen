
{{- define "go-echod773b940-c511-4d2b-a967-bc3148929dfb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod773b940-c511-4d2b-a967-bc3148929dfb.fullname" -}}
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


{{- define "go-echod773b940-c511-4d2b-a967-bc3148929dfb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod773b940-c511-4d2b-a967-bc3148929dfb.labels" -}}
helm.sh/chart: {{ include "go-echod773b940-c511-4d2b-a967-bc3148929dfb.chart" . }}
{{ include "go-echod773b940-c511-4d2b-a967-bc3148929dfb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod773b940-c511-4d2b-a967-bc3148929dfb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod773b940-c511-4d2b-a967-bc3148929dfb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}