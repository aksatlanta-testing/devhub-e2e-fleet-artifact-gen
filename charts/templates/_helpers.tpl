
{{- define "go-echod524776b-be1a-4b69-bd58-88be26fdd9dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod524776b-be1a-4b69-bd58-88be26fdd9dd.fullname" -}}
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


{{- define "go-echod524776b-be1a-4b69-bd58-88be26fdd9dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod524776b-be1a-4b69-bd58-88be26fdd9dd.labels" -}}
helm.sh/chart: {{ include "go-echod524776b-be1a-4b69-bd58-88be26fdd9dd.chart" . }}
{{ include "go-echod524776b-be1a-4b69-bd58-88be26fdd9dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod524776b-be1a-4b69-bd58-88be26fdd9dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod524776b-be1a-4b69-bd58-88be26fdd9dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}