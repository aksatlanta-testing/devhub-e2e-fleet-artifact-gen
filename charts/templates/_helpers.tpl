
{{- define "go-echo0f8a0438-f466-42bb-b5ea-2170b71da9fb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f8a0438-f466-42bb-b5ea-2170b71da9fb.fullname" -}}
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


{{- define "go-echo0f8a0438-f466-42bb-b5ea-2170b71da9fb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0f8a0438-f466-42bb-b5ea-2170b71da9fb.labels" -}}
helm.sh/chart: {{ include "go-echo0f8a0438-f466-42bb-b5ea-2170b71da9fb.chart" . }}
{{ include "go-echo0f8a0438-f466-42bb-b5ea-2170b71da9fb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0f8a0438-f466-42bb-b5ea-2170b71da9fb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0f8a0438-f466-42bb-b5ea-2170b71da9fb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}