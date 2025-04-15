
{{- define "go-echo76479451-a0c2-4999-af5f-ea1d1a8ae194.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76479451-a0c2-4999-af5f-ea1d1a8ae194.fullname" -}}
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


{{- define "go-echo76479451-a0c2-4999-af5f-ea1d1a8ae194.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo76479451-a0c2-4999-af5f-ea1d1a8ae194.labels" -}}
helm.sh/chart: {{ include "go-echo76479451-a0c2-4999-af5f-ea1d1a8ae194.chart" . }}
{{ include "go-echo76479451-a0c2-4999-af5f-ea1d1a8ae194.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo76479451-a0c2-4999-af5f-ea1d1a8ae194.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo76479451-a0c2-4999-af5f-ea1d1a8ae194.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}