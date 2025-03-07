
{{- define "go-echoc65d02fb-0929-4d78-9d08-c2975f65573f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc65d02fb-0929-4d78-9d08-c2975f65573f.fullname" -}}
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


{{- define "go-echoc65d02fb-0929-4d78-9d08-c2975f65573f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc65d02fb-0929-4d78-9d08-c2975f65573f.labels" -}}
helm.sh/chart: {{ include "go-echoc65d02fb-0929-4d78-9d08-c2975f65573f.chart" . }}
{{ include "go-echoc65d02fb-0929-4d78-9d08-c2975f65573f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc65d02fb-0929-4d78-9d08-c2975f65573f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc65d02fb-0929-4d78-9d08-c2975f65573f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}