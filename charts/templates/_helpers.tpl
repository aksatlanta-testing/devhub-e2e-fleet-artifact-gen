
{{- define "go-echofb9951b2-4b93-42e0-8c87-cb68e509db28.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb9951b2-4b93-42e0-8c87-cb68e509db28.fullname" -}}
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


{{- define "go-echofb9951b2-4b93-42e0-8c87-cb68e509db28.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofb9951b2-4b93-42e0-8c87-cb68e509db28.labels" -}}
helm.sh/chart: {{ include "go-echofb9951b2-4b93-42e0-8c87-cb68e509db28.chart" . }}
{{ include "go-echofb9951b2-4b93-42e0-8c87-cb68e509db28.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofb9951b2-4b93-42e0-8c87-cb68e509db28.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofb9951b2-4b93-42e0-8c87-cb68e509db28.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}