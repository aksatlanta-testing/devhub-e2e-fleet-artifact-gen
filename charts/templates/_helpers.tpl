
{{- define "go-echo453e2a5c-0f2f-49f7-bbea-1d735270ce86.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo453e2a5c-0f2f-49f7-bbea-1d735270ce86.fullname" -}}
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


{{- define "go-echo453e2a5c-0f2f-49f7-bbea-1d735270ce86.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo453e2a5c-0f2f-49f7-bbea-1d735270ce86.labels" -}}
helm.sh/chart: {{ include "go-echo453e2a5c-0f2f-49f7-bbea-1d735270ce86.chart" . }}
{{ include "go-echo453e2a5c-0f2f-49f7-bbea-1d735270ce86.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo453e2a5c-0f2f-49f7-bbea-1d735270ce86.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo453e2a5c-0f2f-49f7-bbea-1d735270ce86.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}